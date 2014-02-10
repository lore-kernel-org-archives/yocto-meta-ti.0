Return-Path: <Jose.Alarcon@procemex.com>
Received: from exchange.procemex.com (edgerole.procemex.fi [89.236.108.139])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8A270E0076C
	for <meta-ti@yoctoproject.org>; Sun,  9 Feb 2014 23:21:52 -0800 (PST)
Received: from EXCHANGE.hq.procemex.fi (192.168.123.254) by
	edgerole.procemex.fi (192.168.123.253) with Microsoft SMTP Server (TLS)
	id 14.0.722.0; Mon, 10 Feb 2014 09:21:35 +0200
Received: from EXCHANGE.hq.procemex.fi ([192.168.123.254]) by
	exchange.hq.procemex.fi ([192.168.123.254]) with mapi; Mon, 10 Feb 2014
	09:21:31 +0200
From: Jose Alarcon <Jose.Alarcon@procemex.com>
To: Denys Dmytriyenko <denys@ti.com>
Thread-Topic: [meta-ti] TI boot-monitor recipe doesn't install the boot
	monitor binary in the image
Thread-Index: AQHPJDg13il66fAoKkuOsGldIbqfJ5quFoWc
Date: Mon, 10 Feb 2014 07:21:30 +0000
Message-ID: <DD2F89422B483148BCFD0BF72A6C148A78C81695@exchange.hq.procemex.fi>
References: <DD2F89422B483148BCFD0BF72A6C148A78C815A2@exchange.hq.procemex.fi>,
	<20140207191000.GQ31128@edge>
In-Reply-To: <20140207191000.GQ31128@edge>
Accept-Language: en-US, fi-FI
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
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
X-List-Received-Date: Mon, 10 Feb 2014 07:21:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Denys,

Thanks for your comments. I am following the instructions on the MCSDK wiki=
 page: http://processors.wiki.ti.com/index.php/MCSDK_UG_Chapter_Exploring#U=
BI.2FUBIFS

  NAND Layout
  The NAND flash in the EVM contains three partitions:-

    bootloader - Contains u-boot
    params - contains env variables
    ubifs - contains following UBI volumes:-
    boot volume - contains Kernel image (uImage), device tree blob etc,
    rootfs volume - contains the rootfs which is the primary filesystem

After flashing the ubi image, the boad doesn't boot up unless I force the i=
nstallation of the boot monitor under the /boot dir in the rootfs. The kern=
el and the device tree were there already (didn't check which recipe instal=
l those).

About the update of the keystone recipes to a newer yocto release, do you h=
ave any estimation on when that will be ready? I am anticipating some work =
on our side as well after this update.

Thanks and sorry for the top posting. Using Outlook here :-(

--
Jose
________________________________________
From: Denys Dmytriyenko [denys@ti.com]
Sent: Friday, February 07, 2014 9:10 PM
To: Jose Alarcon
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] TI boot-monitor recipe doesn't install the boot moni=
tor binary in the image

On Fri, Feb 07, 2014 at 10:36:09AM +0000, Jose Alarcon wrote:
> Hi there,
>
> In order to boot ubi images on our Keystone2-evem, we had to modify the
> boot-monitor recipe so that the boot monitor binary gets installed into t=
he
> image.
>
> We fixed this in our own layers with a bbappend file like this:
>
>     PROVIDES +=3D "boot-monitor"
>
>     do_install () {
>         install -d ${D}/boot
>         install ${S}/${BOOT_MONITOR_BINARY} ${D}/boot/${BOOT_MONITOR_IMAG=
E}
>         ln -sf ${BOOT_MONITOR_IMAGE} ${D}/boot/${BOOT_MONITOR_BINARY}
>     }
>
>     FILES_${PN} =3D "/boot ${sysconfdir}"
>
> Should this be fixed in the boot-monitor_git.bb recipe itself?
>
> I am using danny branch of meta-ti, commit 0039248515b16b88161844aef5d507=
737331c834

Jose,

boot-monitor gets deployed as a standalone image, like u-boot, kernel,
devitrees etc. I don't think it needs to go into the rootfs...

Plus, danny branch is long since outdated. Currently we are in the process =
of
updating Keystone recipes, so please stay tuned. Thanks.

--
Denys=

