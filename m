Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C1080E005B4
	for <meta-ti@yoctoproject.org>; Fri,  7 Feb 2014 11:10:06 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s17JA2Ir026925;
	Fri, 7 Feb 2014 13:10:02 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s17JA1k5029263;
	Fri, 7 Feb 2014 13:10:02 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 7 Feb 2014 13:10:01 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s17JA1F2017227;
	Fri, 7 Feb 2014 13:10:01 -0600
Date: Fri, 7 Feb 2014 14:10:01 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jose Alarcon <Jose.Alarcon@procemex.com>
Message-ID: <20140207191000.GQ31128@edge>
References: <DD2F89422B483148BCFD0BF72A6C148A78C815A2@exchange.hq.procemex.fi>
MIME-Version: 1.0
In-Reply-To: <DD2F89422B483148BCFD0BF72A6C148A78C815A2@exchange.hq.procemex.fi>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: TI boot-monitor recipe doesn't install the boot monitor binary in the image
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
X-List-Received-Date: Fri, 07 Feb 2014 19:10:07 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Feb 07, 2014 at 10:36:09AM +0000, Jose Alarcon wrote:
> Hi there,
> 
> In order to boot ubi images on our Keystone2-evem, we had to modify the 
> boot-monitor recipe so that the boot monitor binary gets installed into the 
> image.
> 
> We fixed this in our own layers with a bbappend file like this:
> 
>     PROVIDES += "boot-monitor"
> 
>     do_install () {
>         install -d ${D}/boot
>         install ${S}/${BOOT_MONITOR_BINARY} ${D}/boot/${BOOT_MONITOR_IMAGE}
>         ln -sf ${BOOT_MONITOR_IMAGE} ${D}/boot/${BOOT_MONITOR_BINARY}
>     }
> 
>     FILES_${PN} = "/boot ${sysconfdir}"
> 
> Should this be fixed in the boot-monitor_git.bb recipe itself?
> 
> I am using danny branch of meta-ti, commit 0039248515b16b88161844aef5d507737331c834

Jose,

boot-monitor gets deployed as a standalone image, like u-boot, kernel, 
devitrees etc. I don't think it needs to go into the rootfs...

Plus, danny branch is long since outdated. Currently we are in the process of 
updating Keystone recipes, so please stay tuned. Thanks.

-- 
Denys

