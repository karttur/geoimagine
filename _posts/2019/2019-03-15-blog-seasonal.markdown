---
layout: post
title: The Seasonal python package
modified: '2018-10-24 T18:17:25.000Z'
categories: blog
excerpt: Edit the python package seasonal.
image: avg-trmm-3b43v7-precip_3B43_trmm_2001-2016_A
date: '2019-03-15 12:24'
comments: true
share: true
figure1: avg-grace-ave_ave-cmwater_global_2003-2016_RL05-filled
figure2A: ols-sl-grace-ave_ave-cmwater_global_2003-2016_RL05-filled
figure2B: ts-mdsl-grace-ave_ave-cmwater_global_2003-2016_RL05-filled
figure2C: ts-losl-grace-ave_ave-cmwater_global_2003-2016_RL05-filled
figure2D: ts-hisl-grace-ave_ave-cmwater_global_2003-2016_RL05-filled
---

# Introduction

In this post I will take you through the editing I have done to the package [<span class='package'>seasonal</span>](https://github.com/welch/seasonal/) by Will Welch, for fitting it to the needs of Karttur's GeoImagine Framework.

# Install Seasonal

To install the <span class='package'>seasonal</span> pacakge, either use <span class='teminalapp'>pip</span> or <span class='teminalapp'>conda</span>. At time of writing the <span class='teminalapp'>conda</span> installer was a bit outdate, and I used <span class='teminalapp'>pip</span> for installing <span class='package'>seasonal</span>:

<span class='terminal'>$ pip install seasonal</span>

Instructions for installations using [conda ](https://anaconda.org/derickl/seasonal):

<span class='terminal'>$ conda install -c derickl seasonal</span>

Once installed, you can use the <span class='package'>seasonal</span> package as instructed on the [GitHub](https://github.com/welch/seasonal/) page.

The original package, however, includes some implicit assumptions that are converted to explicit parameters when used with Karttur´s GeoImagine Framework. I then also added the option of filtering using a customised kernel.

## Editing the Seasonal source code

For use with karttur´s GeoImagine Framework, changes are made to the following modules of the <span class='package'>seasonal</span> package:

- seasonal.py
- trend.py

If you have installed the complete Spatial Data Integrated Development Environment (SPIDE) using <span class='app'>Anaconda</span>, the path to your <span class='file'>site-packages</span> should be something like:

<span class=terminal>$ /Users/youruser/anaconda3/lib/python3.6/site-packages</span>

under the <span class='file'>site-packages</span> you should now have the folder <span class='file'>seasonal</span>.

To edit the modules, you can use <span class='app'>Eclipse</span>. Use the menu system <span class='menu'>File: Open File...</span>.

### seasonal.py

#### def fit_seasons

The function *fit_seasons* is expanded and includes three additional boolean variables _trendonly_, _forceseason_, and _kernel_, all set to _False_ as default.

If _terndonly_ is set to _True_, *fit_seasons* only returns the trend (speeding up processing). If _forceseason_ is set to _True_, the seasonal component is calculated regardless of the significance with which it is calculated. If the _kernel_ parameter is set to a list ([i,j,k,j,i]), this kernel will be used for filtering the time series.

```
def fit_seasons(data, trend="spline", period=None, min_ev=0.05,
                periodogram_thresh=0.5, ptimes=1, trendonly=False, forceseason=False, kernel=False):

    trendtype = trend
    if trend is None:
        trend = np.zeros(len(data))
    elif not isinstance(trend,  np.ndarray):
        trend = fit_trend(data, kind=trend, period=period, ptimes=ptimes, kernel=kernel)
    else:
        assert isinstance(trend,  np.ndarray)
    if trendonly:
        return (None, trend)
    data = data - trend
    var = data.var()
    if np.isclose(var, 0.0):
        return (None, trend)

    if period:
        # compute seasonal offsets for given period
        start= period; stop = len(data)-period
        cv_mse, cv_seasons = gcv(data[start:stop], period)
        '''
        if trendtype == 'kernel':
            start= int(period/2); stop = len(data)-int(period/2)
            cv_mse, cv_seasons = gcv(data[start:stop], period)
        else:
            cv_mse, cv_seasons = gcv(data, period)
        '''
        if forceseason:
            return (cv_seasons, trend)
        fev = 1 - cv_mse / var
        if np.isclose(cv_mse, 0.0) or fev >= min_ev:
            return (cv_seasons, trend)
        else:
            return (None, trend)
    if periodogram_thresh and period is None:
        # find intervals containing best period
        peaks = periodogram_peaks(data, thresh=periodogram_thresh)
        if peaks is None:
            return (None, trend)
        peaks = sorted(peaks)
    else:
        # search everything (XXX parameterize this)
        peaks = [(0, 0, 4, len(data) // 2)]
    cv_mse, cv_seasons = np.inf, []
    period = 0
    for interval in peaks:
        period = max(period, interval[2])
        while period <= interval[3]:
            _mse, _seasons = gcv(data, period)
            if _mse < cv_mse:
                cv_mse, cv_seasons = _mse, _seasons
            period += 1
    if np.isclose(cv_mse, 0.0) or min_ev <= 1 - cv_mse / var:
        return (cv_seasons, trend)
    else:
        return (None, trend)
```

### trend.py

#### def fit_seasons

In Karttur´s version the function *fit_seasons* in the module <span class='package'>trend.py</span> expects the additional variable _kernel_. If _kernel_ is set to _False_ (default) the parameter has no effect. If, however, a _kernel_ is defined, this array will be used for filtering the time series data.

Also the parameter _ptimes_ is changed in Karttur´s version. In the original package _ptimes_ is hardcoded to 2, whereas is Karttur's version it is defaulted to 1, but can be set to any integer.

```
def fit_trend(data, kind="spline", period=None, ptimes=1, kernel=np.array([])):
    print 'ptimes',ptimes

    """Fit a trend for a possibly noisy, periodic timeseries.

    Trend may be modeled by a line, cubic spline, or mean or median
    filtered series.

    Parameters
    ----------
    data : ndarray
        list of observed values
    kind : string ("mean", "median", "line", "spline","kernel", None)
        if mean, apply a period-based mean filter
        if median, apply a period-based median filter
        if line, fit a slope to median-filtered data.
        if spline, fit a piecewise cubic spline to the data
        if None, return zeros
    period : number
        seasonal periodicity, for filtering the trend.
        if None, will be estimated.
    ptimes : number
        multiple of period to use as smoothing window size
    kernel : ndarray
        kernel array

    Returns
    -------
    trend : ndarray

    """
    if kind is None:
        return np.zeros(len(data)) + np.mean(data)
    if period is None:
        period = guess_trended_period(data)
    window = (int(period * ptimes) // 2) * 2 - 1 # odd window
    if kind == "median":
        filtered = aglet(median_filter(data, window), window)
    elif kind == "mean":
        filtered = aglet(mean_filter(data, window), window)
    elif kind == "line":
        filtered = line_filter(data, window)
    elif kind == "spline":
        #changed by tg to just 1  
        '''      
        nsegs = len(data) // (window * 2) + 1
        filtered = aglet(spline_filter(data, nsegs), window)
        '''
        nsegs = len(data) // (window * 1) + 1
        filtered = aglet(spline_filter(data, nsegs), window)
        '''
        nsegs = len(data) / window
        print 'window',window
        print 'len(data)',len(data)
        print 'nsegs',nsegs
        #BALLE
        #win = int(window/2)
        filtered = aglet(spline_filter(data, nsegs), window)
        '''
    elif kind == "kernel":
        #ADDED BY TG
        kernel /= kernel.sum()

        filtered = np.convolve(data, kernel, mode='same')

    else:
        raise Exception("adjust_trend: unknown filter type {}".format(kind))
    return filtered
```
