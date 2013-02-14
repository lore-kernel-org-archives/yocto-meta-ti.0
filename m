Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id B210AE006C9;
	Thu, 14 Feb 2013 08:28:57 -0800 (PST)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1EGSuu0027939;
	Thu, 14 Feb 2013 10:28:56 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1EGSuca007523;
	Thu, 14 Feb 2013 10:28:56 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 14 Feb 2013 10:28:55 -0600
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r1EGStpt023631;
	Thu, 14 Feb 2013 10:28:55 -0600
Date: Thu, 14 Feb 2013 11:28:55 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Raul Rosetto Munoz <munoz0raul@gmail.com>
Message-ID: <20130214162854.GF2539@edge>
References: <CANmViriV1_tAO+j_nTkpZjcSRD8dh2ALXwHVs1QC-9_dDmrfFA@mail.gmail.com>
	<20130212191553.GA1858@denix.org>
	<CANmViriOFXRsW10XWXk8vJpCEQgTgq2VGr4A+Roa0SYVz9Z2DQ@mail.gmail.com>
	<20130214160030.GD2539@edge>
	<CANmVirgL6Fte5cP+VTdK4aTb4sBB1AXQOq=02DtaiNnRePfwPw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANmVirgL6Fte5cP+VTdK4aTb4sBB1AXQOq=02DtaiNnRePfwPw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
Subject: Re: Wifi Module + udev configs
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
X-List-Received-Date: Thu, 14 Feb 2013 16:28:57 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Feb 14, 2013 at 02:23:14PM -0200, Raul Rosetto Munoz wrote:
> Denys,
> There are something strange,
> 
> First there are no  linux-firmware-{rtl8192cu,rtl8192ce,rtl8192su}
> installed at rfs.

I was talking about packages, looks like you have them already installed.


> raul@phi04:.../tmp/deploy/images$ find
> /media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/firmware/ -name "*8192*"
> /media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/firmware/RTL8192E
> /media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/firmware/rtlwifi/rtl8192sefw.bin
> /media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/firmware/rtlwifi/rtl8192defw.bin
> 
> Another problem is that "/lib/udev/firmware" are not installed to.
> 
> raul@phi04:.../tmp/deploy/images$ find
> /media/ed86e6a2-20c2-464e-a2f3-f28ff48983ef/lib/udev/ -name "*firmware*"
> raul@phi04:.../tmp/deploy/images$

What is your udev version?


> But I can see theses files at my "tmp/sysroots/beaglebone"
> 
> raul@phi04:.../tmp/sysroots/beaglebone$ find lib/firmware/ -name "*8192*"
> lib/firmware/RTL8192E
> lib/firmware/rtlwifi/rtl8192sefw.bin
> lib/firmware/rtlwifi/rtl8192defw.bin
> lib/firmware/rtlwifi/rtl8192cfw.bin
> lib/firmware/rtlwifi/rtl8192cufw.bin
> 
> raul@phi04:.../tmp/sysroots/beaglebone$ find lib/udev/ -name "*firmware*"
> lib/udev/firmware
> lib/udev/rules.d/50-firmware.rules
> 
> I tryed copy this files for the sdcard but doesnt work.
> 
> Do you have any suggest?
> 
> Thanks for all help.

