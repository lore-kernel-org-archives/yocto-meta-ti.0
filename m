Return-Path: <net147@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 87EF9E00510
	for <meta-ti@yoctoproject.org>; Wed, 29 Jan 2014 05:15:04 -0800 (PST)
Received: by mail-pa0-f41.google.com with SMTP id fa1so1748642pad.0
	for <meta-ti@yoctoproject.org>; Wed, 29 Jan 2014 05:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=aH27pS4CeScqhr1n9yVCuOr850RqU6nFuWiTyDVwsGI=;
	b=IalI7dj/nox+JD93am+uGJigIAsh42/izesmtEJiPFmchXMxn/H9AvfMliCo6XtKmb
	f7D5VMeSSmNQlg6XfO1e5a5/Ke+44guKjJ0L3i5SwUvc2I9k15kJ79w3rborlMWvd9OO
	hbxHgam5nhkhMu8Yg8o9p6B6ZDcWxuHxfBFdxNWmjoh0nUyIQyOJgrjuO/P4+vzNSuOR
	Q9Mo8tve3eEOlohxGCeF4rvhExUlheLCxabD+xaa2WYW22R4u47SUHGIRI6t2IQ1aUqE
	BZTWlPn754BlN7aoHSw3bIyi3ty+E2mxcfE9A1uhU+EiDdsonpMRPatkUx1KAs1bZ1AR
	CZaw==
X-Received: by 10.66.25.101 with SMTP id b5mr7863527pag.101.1391001304583;
	Wed, 29 Jan 2014 05:15:04 -0800 (PST)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	qf7sm16571407pac.14.2014.01.29.05.15.02
	for <meta-ti@yoctoproject.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 29 Jan 2014 05:15:03 -0800 (PST)
Message-ID: <52E8FD68.3000503@gmail.com>
Date: Thu, 30 Jan 2014 00:08:56 +1100
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
Subject: BeagleBone Black - linux-ti-staging and kernel modesetting
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Jan 2014 13:15:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I am using Yocto dora release with latest meta-ti git compiling for 
BeagleBone Black using systemd.
For systemd to boot I had created linux-ti-staging_3.12.bbappend with 
do_configure_append() that
appends the following options to kernel config:
CONFIG_CGROUPS=y
CONFIG_FHANDLE=y

More kernel options to enable additional support for systemd can be 
found at: http://cgit.freedesktop.org/systemd/systemd/tree/README

I have also added the following for graphics support:
CONFIG_DRM=y
CONFIG_DRM_KMS_HELPER=y
CONFIG_DRM_GEM_CMA_HELPER=y
CONFIG_DRM_KMS_CMA_HELPER=y
CONFIG_DRM_I2C_NXP_TDA998X=y
CONFIG_DRM_TILCDC=y

The kernel mode switching (using xf86-video-modesetting) with HDMI 
output however is not working.

The kernel log shows:
tilcdc 4830e000.lcdc: no encoders/connectors found
tilcdc 4830e000.lcdc: failed to initialize mode setting

The expected result (from Arch Linux ARM) is:
tilcdc 4830e000.fb: found TDA19988
tilcdc 4830e000.fb: fb0:  frame buffer device
tilcdc 4830e000.fb: registered panic notifier
[drm] Initialized tilcdc 1.0.0 20121205 on minor 0

/sys/class/drm/card0/card0-HDMI-A-1 doesn't exist also.
What am I missing to get KMS working with meta-ti linux-ti-staging for 
the BeagleBone Black?

Regards,
Jonathan

