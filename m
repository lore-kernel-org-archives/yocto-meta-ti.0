Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1F8A4E01599
	for <meta-ti@yoctoproject.org>; Thu, 26 Sep 2013 06:42:32 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8QDgWfG026286
	for <meta-ti@yoctoproject.org>; Thu, 26 Sep 2013 08:42:32 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8QDgWAE024050;
	Thu, 26 Sep 2013 08:42:32 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 26 Sep 2013 08:42:31 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8QDgVDv026700;
	Thu, 26 Sep 2013 08:42:31 -0500
Date: Thu, 26 Sep 2013 09:42:31 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20130926134231.GE14528@edge>
References: <1380112791-22545-1-git-send-email-x0171695@ti.com>
	<1380112791-22545-2-git-send-email-x0171695@ti.com>
	<7D46E86EC0A8354091174257B2FED1015974D5A7@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015974D5A7@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "Muddegowda, Deepak" <x0171695@ti.com>, "Mankad,
	Maulik Ojas" <maulik@ti.com>,
	"meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	"epos_dev@list.ti.com - Internal mailing list for EPOS dev team \(May
	contain non-TIers\)" <epos_dev@list.ti.com>, "Srinivasan,
	Nageswari" <nageswari@ti.com>
Subject: Re: [meta-ti patch v3 1/3] am43xx : Added machine config for am437x EPOS machine
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
X-List-Received-Date: Thu, 26 Sep 2013 13:42:33 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Sep 25, 2013 at 09:43:20AM -0400, Maupin, Chase wrote:
> >-----Original Message-----
> >From: Muddegowda, Deepak
> >Sent: Wednesday, September 25, 2013 7:40 AM
> >To: Srinivasan, Nageswari; Maupin, Chase; Heroor, Siddharth;
> >Cooper Jr., Franklin; Dmytriyenko, Denys; Mankad, Maulik Ojas;
> >Muddegowda, Deepak; epos_dev@list.ti.com - Internal mailing list
> >for EPOS dev team (May contain non-TIers); meta-
> >ti@yoctoproject.org
> >Subject: [meta-ti patch v3 1/3] am43xx : Added machine config for
> >am437x EPOS machine
> >
> >As this belongs to the ti43x SOC_FAMILY inluding the
> >ti43x`s include.
> >
> >Signed-off-by: Deepak M <x0171695@ti.com>
> >---
> >v3 :
> >1. Changed the machine name to am437x-epos-evm
> >2. Changed the UBOOT_MACHINE
> >3. Adding the meta-ti@yoctoproject.org list for review.
> >
> > conf/machine/am437x-epos-evm.conf | 38
> >++++++++++++++++++++++++++++++++++++++
> > 1 file changed, 38 insertions(+)
> > create mode 100644 conf/machine/am437x-epos-evm.conf
> >
> >diff --git a/conf/machine/am437x-epos-evm.conf
> >b/conf/machine/am437x-epos-evm.conf
> >new file mode 100644
> >index 0000000..a9adf7e
> >--- /dev/null
> >+++ b/conf/machine/am437x-epos-evm.conf
> >@@ -0,0 +1,38 @@
> >+#@TYPE: Machine
> >+#@NAME: AM43xx EVM
> >+#@DESCRIPTION: Machine configuration for the TI AM43xx EVM
> >+
> >+require conf/machine/include/ti43x.inc
> >+
> >+# Use built-in LCD by default
> >+XSERVER += "xf86-input-tslib"
> >+GUI_MACHINE_CLASS = "smallscreen"
> >+MACHINE_FEATURES += "touchscreen"
> 
> Denys, input on these lines above?

Those lines only required if the EVM comes with a built-in LCD screen with 
touch panel (like AM37x or AM335x or AM18x). They overwrite the default 
settings of an external DVI/HDMI screen w/o touch panel (like OMAP4/5 or 
Beagles).


> >+IMAGE_FSTYPES += "ubi tar.gz"
> >+
> >+SERIAL_CONSOLE = "115200 ttyO0"
> >+
> >+# UBI information.  Note that this is board and kernel specific.
> >Changes
> >+# in your kernel port may require changes in these variables.
> >For more
> >+# details about this board please see
> >+# http://processors.wiki.ti.com/index.php/UBIFS_Support
> >+
> >+# do ubiattach /dev/ubi_ctrl -m 7 -O 2048
> >+# From dmesg:
> >+# UBI: smallest flash I/O unit:    2048
> >+# UBI: logical eraseblock size:    126976 bytes
> >+# from ubiattach stdout:
> >+# UBI device number 0, total 1988 LEBs
> >+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 3836"
> >+
> >+# do ubiattach /dev/ubi_ctrl -m 7 -O 2048
> >+# from dmesg:
> >+# UBI: smallest flash I/O unit:    2048
> >+# UBI: physical eraseblock size:   131072 bytes (128 KiB)
> >+# UBI: sub-page size:              512
> >+# UBI: VID header offset:          2048 (aligned 2048)
> >+UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512 -O 2048"
> >+
> >+UBOOT_MACHINE = "am43xx_evm"
> 
> Maybe a silly question but why the change in UBOOT_MACHINE?
> 
> >+PPA_PROJ = "hyperseam"
> >--
> >1.8.1
> 

