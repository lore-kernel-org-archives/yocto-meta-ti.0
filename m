Return-Path: <net147@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E6126E006E8
	for <meta-ti@yoctoproject.org>; Wed, 29 Jan 2014 15:33:10 -0800 (PST)
Received: by mail-pd0-f178.google.com with SMTP id y13so2324724pdi.9
	for <meta-ti@yoctoproject.org>; Wed, 29 Jan 2014 15:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=Midti4aiU8hPVdNOu9xbcJz+kVGNkeMrdFo4H7AlesE=;
	b=NbC4C3UtlYa7R9HRJiqmdrsDaVzeKdhL80i/d3L8z7bXnK6xOF5UOo8fzXKK8YUhuF
	xXkLpJitUcf2Zs0qE1245TKqH9K3Tg5YDvyj+T26JfsTtsRPeWzzgUOtA+uT/teiTh7v
	pWyOrSOjINMYDDY+o++WPweKb9+sGJySVxGapwYZx5bGF4x/Jtb20AKNxEFT3mPeZb+n
	Irl7Hzb+vUYYZ7AuUpNw9Matj5fEds5S7er6TmE6YOKzAO0fhqn78uvZFgs892mp38vp
	R4MjpFO2aYei8umjaiTMQKh4kneFhivnLZLNPbUUt0FkCN4KM6l4dRBMUIOkHGZ/Vabk
	PWXw==
X-Received: by 10.68.14.130 with SMTP id p2mr11062959pbc.17.1391038390276;
	Wed, 29 Jan 2014 15:33:10 -0800 (PST)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	oa3sm10916628pbb.15.2014.01.29.15.33.08 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 29 Jan 2014 15:33:09 -0800 (PST)
Message-ID: <52E98E46.5020308@gmail.com>
Date: Thu, 30 Jan 2014 10:27:02 +1100
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>, meta-ti@yoctoproject.org
References: <20140129172146.GS6814@edge>	<1A80A2FD7F34484786E5DF71F3968B6941E82C1A@DLEE10.ent.ti.com>
	<20140129214604.GU6814@edge>
In-Reply-To: <20140129214604.GU6814@edge>
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
X-List-Received-Date: Wed, 29 Jan 2014 23:33:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Denys,

On 30/01/2014 8:46 AM, Denys Dmytriyenko wrote:
> Jonathan,
>
> Here's the reply from our DRM guy:
>
>> It should work, it looks to me like it is failing to probe for the tda998x
>> which is why the DRM driver is reporting no connectors/encoders.  They will
>> also need to make some changes to the DTS to get the thing to probe.  This
>> document has the necessary DT entries - refer to the DRM section - (it
>> wasn't there for the last 3.12 release so not an RTFM message).
>> http://processors.wiki.ti.com/index.php/Linux_Core_LCD_Controller_User_Guide#AM335x_LCDC_Display_Driver_.28fbdev.29
>>
>> Darren
On the wiki page, should "pinctrl-0 = <&nxp_hdmi_pin_mux>;" be 
"pinctrl-0 = <&nxp_hdmi_bonelt_pins>;" as indicated by
https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/tree/Documentation/devicetree/bindings/drm/tilcdc/slave.txt?id=refs/tags/v3.12.8
?

Regards,
Jonathan

>>
>>> Date: Thu, 30 Jan 2014 00:08:56 +1100
>>> From: Jonathan Liu <net147@gmail.com>
>>> To: meta-ti@yoctoproject.org
>>> Subject: [meta-ti] BeagleBone Black - linux-ti-staging and kernel modesetting
>>>
>>> Hi,
>>>
>>> I am using Yocto dora release with latest meta-ti git compiling for
>>> BeagleBone Black using systemd.
>>> For systemd to boot I had created linux-ti-staging_3.12.bbappend with
>>> do_configure_append() that
>>> appends the following options to kernel config:
>>> CONFIG_CGROUPS=y
>>> CONFIG_FHANDLE=y
>>>
>>> More kernel options to enable additional support for systemd can be
>>> found at: http://cgit.freedesktop.org/systemd/systemd/tree/README
>>>
>>> I have also added the following for graphics support:
>>> CONFIG_DRM=y
>>> CONFIG_DRM_KMS_HELPER=y
>>> CONFIG_DRM_GEM_CMA_HELPER=y
>>> CONFIG_DRM_KMS_CMA_HELPER=y
>>> CONFIG_DRM_I2C_NXP_TDA998X=y
>>> CONFIG_DRM_TILCDC=y
>>>
>>> The kernel mode switching (using xf86-video-modesetting) with HDMI
>>> output however is not working.
>>>
>>> The kernel log shows:
>>> tilcdc 4830e000.lcdc: no encoders/connectors found
>>> tilcdc 4830e000.lcdc: failed to initialize mode setting
>>>
>>> The expected result (from Arch Linux ARM) is:
>>> tilcdc 4830e000.fb: found TDA19988
>>> tilcdc 4830e000.fb: fb0:  frame buffer device
>>> tilcdc 4830e000.fb: registered panic notifier
>>> [drm] Initialized tilcdc 1.0.0 20121205 on minor 0
>>>
>>> /sys/class/drm/card0/card0-HDMI-A-1 doesn't exist also.
>>> What am I missing to get KMS working with meta-ti linux-ti-staging for
>>> the BeagleBone Black?
>>>
>>> Regards,
>>> Jonathan
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


