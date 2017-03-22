Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DC59BE0093F; Tue, 21 Mar 2017 18:23:47 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9CA0AE00655
	for <meta-ti@yoctoproject.org>; Tue, 21 Mar 2017 18:23:44 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2M1NfsY009024;
	Tue, 21 Mar 2017 20:23:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1490145821;
	bh=pFEYblRbbYBlk6SnQpFe/FWoKSik3R8obtMwDmMNkI0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Y2AYZQ975ZnId+LLNUpQpWUIo9/DRhAiD4T18r6fhBo3yOCmSda/SbT6JuPj57CTh
	9cuxfTpcPLi3Ve5JQFBLtPQbo3BtJzbGe5sYeW6DroBR7+uD7ZoKAHC7fskCNSXxYL
	pgi4PsdUOM5cnQoxZ4QVGf00vC04eoZE0QzSna28=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2M1NfRR024000;
	Tue, 21 Mar 2017 20:23:41 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 21 Mar 2017 20:23:40 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2M1NeZm022563;
	Tue, 21 Mar 2017 20:23:40 -0500
Date: Tue, 21 Mar 2017 21:23:40 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Florian Wickert <fw@javox-solutions.com>
Message-ID: <20170322012340.GA29187@edge>
References: <1490035085-42076-1-git-send-email-denys@ti.com>
	<1490035085-42076-4-git-send-email-denys@ti.com>
	<5bda86bb-c724-daf0-8170-edf05519dff4@javox-solutions.com>
MIME-Version: 1.0
In-Reply-To: <5bda86bb-c724-daf0-8170-edf05519dff4@javox-solutions.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [morty/master][PATCH 4/4] beagle-x15: add separate config for BeagleBoard X15
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
X-List-Received-Date: Wed, 22 Mar 2017 01:23:48 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Mar 21, 2017 at 09:53:52AM +0100, Florian Wickert wrote:
> I don't see the
> UBOOT_MACHINE = "beagle_x15_config"
> in the current u-boot-ti-staging sources.
> At least not in ti-u-boot-2017.01 and ti-u-boot-2017.01-next branches.

Yes, good catch! I guess I was overzealous with search and replace. Fixed.

-- 
Denys


> On 03/20/2017 07:38 PM, Denys Dmytriyenko wrote:
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> >  conf/machine/beagle-x15.conf | 34 ++++++++++++++++++++++++++++++++++
> >  1 file changed, 34 insertions(+)
> >  create mode 100644 conf/machine/beagle-x15.conf
> >
> >diff --git a/conf/machine/beagle-x15.conf b/conf/machine/beagle-x15.conf
> >new file mode 100644
> >index 0000000..276de26
> >--- /dev/null
> >+++ b/conf/machine/beagle-x15.conf
> >@@ -0,0 +1,34 @@
> >+#@TYPE: Machine
> >+#@NAME: BeagleBoard X15
> >+#@DESCRIPTION: Machine configuration for the BeagleBoard X15
> >+
> >+require conf/machine/include/dra7xx.inc
> >+
> >+IMAGE_FSTYPES += "tar.xz"
> >+
> >+SERIAL_CONSOLE = "115200 ttyS2"
> >+
> >+KERNEL_DEVICETREE = "am57xx-beagle-x15.dtb am57xx-beagle-x15-revb1.dtb"
> >+
> >+UBOOT_MACHINE = "beagle_x15_config"
> >+
> >+# UBI information.  Note that this is board and kernel specific.  Changes
> >+# in your kernel port may require changes in these variables.  For more
> >+# details about this board please see
> >+# http://processors.wiki.ti.com/index.php/UBIFS_Support
> >+
> >+# do ubiattach /dev/ubi_ctrl -m 7 -O 2048
> >+# From dmesg:
> >+# UBI: smallest flash I/O unit:    2048
> >+# UBI: logical eraseblock size:    126976 bytes
> >+# from ubiattach stdout:
> >+# UBI device number 0, total 1988 LEBs
> >+MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 8192"
> >+
> >+# do ubiattach /dev/ubi_ctrl -m 7 -O 2048
> >+# from dmesg:
> >+# UBI: smallest flash I/O unit:    2048
> >+# UBI: physical eraseblock size:   131072 bytes (128 KiB)
> >+# UBI: sub-page size:              512
> >+# UBI: VID header offset:          2048 (aligned 2048)
> >+UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512 -O 2048"
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

