Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0852FE00404
	for <meta-ti@yoctoproject.org>; Wed, 12 Feb 2014 12:01:08 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1CK14Cx022456;
	Wed, 12 Feb 2014 14:01:04 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1CK14it019343;
	Wed, 12 Feb 2014 14:01:04 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 12 Feb 2014 14:01:04 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1CK13Jg020210;
	Wed, 12 Feb 2014 14:01:04 -0600
Date: Wed, 12 Feb 2014 15:01:03 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jose Alarcon <Jose.Alarcon@procemex.com>
Message-ID: <20140212200103.GR4346@edge>
References: <DD2F89422B483148BCFD0BF72A6C148A78C815A2@exchange.hq.procemex.fi>
	<20140207191000.GQ31128@edge>
	<DD2F89422B483148BCFD0BF72A6C148A78C81695@exchange.hq.procemex.fi>
MIME-Version: 1.0
In-Reply-To: <DD2F89422B483148BCFD0BF72A6C148A78C81695@exchange.hq.procemex.fi>
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
X-List-Received-Date: Wed, 12 Feb 2014 20:01:09 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Feb 10, 2014 at 07:21:30AM +0000, Jose Alarcon wrote:
> Hello Denys,
> 
> Thanks for your comments. I am following the instructions on the MCSDK wiki 
> page: 
> http://processors.wiki.ti.com/index.php/MCSDK_UG_Chapter_Exploring#UBI.2FUBIFS
> 
>   NAND Layout
>   The NAND flash in the EVM contains three partitions:-
> 
>     bootloader - Contains u-boot
>     params - contains env variables
>     ubifs - contains following UBI volumes:-
>     boot volume - contains Kernel image (uImage), device tree blob etc,
>     rootfs volume - contains the rootfs which is the primary filesystem
> 
> After flashing the ubi image, the boad doesn't boot up unless I force the 
> installation of the boot monitor under the /boot dir in the rootfs. The 
> kernel and the device tree were there already (didn't check which recipe 
> install those).

The instructions above talk extensively about boot-monitor and the need to 
load it in RAM from U-boot. It doesn't say the image should be part of roofs.


> About the update of the keystone recipes to a newer yocto release, do you 
> have any estimation on when that will be ready? I am anticipating some work 
> on our side as well after this update.

The necessary Keystone recipes and updates are now being submitted, reviewed 
and pushed to main meta-ti (and meta-arago) repositories. No ETA yet.


> Thanks and sorry for the top posting. Using Outlook here :-(
> 
> --
> Jose
> ________________________________________
> From: Denys Dmytriyenko [denys@ti.com]
> Sent: Friday, February 07, 2014 9:10 PM
> To: Jose Alarcon
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] TI boot-monitor recipe doesn't install the boot monitor binary in the image
> 
> On Fri, Feb 07, 2014 at 10:36:09AM +0000, Jose Alarcon wrote:
> > Hi there,
> >
> > In order to boot ubi images on our Keystone2-evem, we had to modify the
> > boot-monitor recipe so that the boot monitor binary gets installed into the
> > image.
> >
> > We fixed this in our own layers with a bbappend file like this:
> >
> >     PROVIDES += "boot-monitor"
> >
> >     do_install () {
> >         install -d ${D}/boot
> >         install ${S}/${BOOT_MONITOR_BINARY} ${D}/boot/${BOOT_MONITOR_IMAGE}
> >         ln -sf ${BOOT_MONITOR_IMAGE} ${D}/boot/${BOOT_MONITOR_BINARY}
> >     }
> >
> >     FILES_${PN} = "/boot ${sysconfdir}"
> >
> > Should this be fixed in the boot-monitor_git.bb recipe itself?
> >
> > I am using danny branch of meta-ti, commit 0039248515b16b88161844aef5d507737331c834
> 
> Jose,
> 
> boot-monitor gets deployed as a standalone image, like u-boot, kernel,
> devitrees etc. I don't think it needs to go into the rootfs...
> 
> Plus, danny branch is long since outdated. Currently we are in the process of
> updating Keystone recipes, so please stay tuned. Thanks.
> 
> --
> Denys

