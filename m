Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 13000E0043F
	for <meta-ti@yoctoproject.org>; Wed, 29 Jan 2014 13:46:07 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0TLk5Qh016052
	for <meta-ti@yoctoproject.org>; Wed, 29 Jan 2014 15:46:05 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0TLk5rb018408
	for <meta-ti@yoctoproject.org>; Wed, 29 Jan 2014 15:46:05 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 29 Jan 2014 15:46:05 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0TLk50f022265	for
	<meta-ti@yoctoproject.org>; Wed, 29 Jan 2014 15:46:05 -0600
Date: Wed, 29 Jan 2014 16:46:04 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-ti@yoctoproject.org>
Message-ID: <20140129214604.GU6814@edge>
References: <20140129172146.GS6814@edge>
	<1A80A2FD7F34484786E5DF71F3968B6941E82C1A@DLEE10.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <1A80A2FD7F34484786E5DF71F3968B6941E82C1A@DLEE10.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: BeagleBone Black - linux-ti-staging and kernel modesetting
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
X-List-Received-Date: Wed, 29 Jan 2014 21:46:10 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Jonathan,

Here's the reply from our DRM guy:

> It should work, it looks to me like it is failing to probe for the tda998x 
> which is why the DRM driver is reporting no connectors/encoders.  They will 
> also need to make some changes to the DTS to get the thing to probe.  This 
> document has the necessary DT entries - refer to the DRM section - (it 
> wasn't there for the last 3.12 release so not an RTFM message).  
> http://processors.wiki.ti.com/index.php/Linux_Core_LCD_Controller_User_Guide#AM335x_LCDC_Display_Driver_.28fbdev.29
> 
> Darren
> 
> > Date: Thu, 30 Jan 2014 00:08:56 +1100
> > From: Jonathan Liu <net147@gmail.com>
> > To: meta-ti@yoctoproject.org
> > Subject: [meta-ti] BeagleBone Black - linux-ti-staging and kernel modesetting
> > 
> > Hi,
> > 
> > I am using Yocto dora release with latest meta-ti git compiling for
> > BeagleBone Black using systemd.
> > For systemd to boot I had created linux-ti-staging_3.12.bbappend with
> > do_configure_append() that
> > appends the following options to kernel config:
> > CONFIG_CGROUPS=y
> > CONFIG_FHANDLE=y
> > 
> > More kernel options to enable additional support for systemd can be
> > found at: http://cgit.freedesktop.org/systemd/systemd/tree/README
> > 
> > I have also added the following for graphics support:
> > CONFIG_DRM=y
> > CONFIG_DRM_KMS_HELPER=y
> > CONFIG_DRM_GEM_CMA_HELPER=y
> > CONFIG_DRM_KMS_CMA_HELPER=y
> > CONFIG_DRM_I2C_NXP_TDA998X=y
> > CONFIG_DRM_TILCDC=y
> > 
> > The kernel mode switching (using xf86-video-modesetting) with HDMI
> > output however is not working.
> > 
> > The kernel log shows:
> > tilcdc 4830e000.lcdc: no encoders/connectors found
> > tilcdc 4830e000.lcdc: failed to initialize mode setting
> > 
> > The expected result (from Arch Linux ARM) is:
> > tilcdc 4830e000.fb: found TDA19988
> > tilcdc 4830e000.fb: fb0:  frame buffer device
> > tilcdc 4830e000.fb: registered panic notifier
> > [drm] Initialized tilcdc 1.0.0 20121205 on minor 0
> > 
> > /sys/class/drm/card0/card0-HDMI-A-1 doesn't exist also.
> > What am I missing to get KMS working with meta-ti linux-ti-staging for
> > the BeagleBone Black?
> > 
> > Regards,
> > Jonathan

