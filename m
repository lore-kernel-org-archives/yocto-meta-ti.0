Return-Path: <r-monk@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AB755E0123F
	for <meta-ti@yoctoproject.org>; Wed, 15 Feb 2012 07:11:25 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q1FFBNJh027389;
	Wed, 15 Feb 2012 09:11:23 -0600
Received: from DNCE73.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q1FFBM6a004337;
	Wed, 15 Feb 2012 09:11:22 -0600 (CST)
Received: from DNCE02.ent.ti.com ([fe80::e5b6:a692:b14:3c86]) by
	DNCE73.ent.ti.com ([fe80::a454:462:d009:b2c%21]) with mapi id
	14.01.0323.003; Wed, 15 Feb 2012 16:11:22 +0100
From: "Monk, Roger" <r-monk@ti.com>
To: "Peter A. Bigot" <bigotp@acm.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 3/4] ti-codecs-omap3530: fix for corrected
	ti-eula-unpack
Thread-Index: AQHM4BWlvBrkYKrfLEO2Onu50VCTHpY+JxyA
Date: Wed, 15 Feb 2012 15:11:21 +0000
Message-ID: <4C82F39BABFE6A429733A300DEBF52240B5E7FCF@DNCE02.ent.ti.com>
References: <1328013657-2069-1-git-send-email-bigotp@acm.org>
	<1328013657-2069-4-git-send-email-bigotp@acm.org>
In-Reply-To: <1328013657-2069-4-git-send-email-bigotp@acm.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.167.88.84]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] ti-codecs-omap3530: fix for corrected	ti-eula-unpack
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Feb 2012 15:11:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2012 at 12:40:56, Peter A. Bigot wrote:
> Subject: [meta-ti] [PATCH 3/4] ti-codecs-omap3530: fix for corrected
> ti-eula-unpack
>
> From: "Peter A. Bigot" <bigotp@acm.org>
>
> Remove directory prefix for tar files that use TI_BIN_UNPK_CMDS that
> specifies unpacking into workdir; formerly that specification was
> ignored and these were unpacked into a package-specific subdirectory
> of ${HOME}=3D${WORKDIR}.  Note c64xplus_deinterlacer overrides
> TI_BIN_UNPK_CMDS and does not specify workdir, so its prefix is
> correct.
>
> Signed-off-by: Peter A. Bigot <bigotp@acm.org>

Acked-by: Roger Monk <r-monk@ti.com>

> ---
>  .../codec-engine/ti-codecs-omap3530_4.00.00.00.bb  |   20 ++++++++++--
> --------
>  1 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb
> b/recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb
> index ae218b1..ea9f389 100644
> --- a/recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb
> +++ b/recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb
> @@ -77,43 +77,43 @@ python do_unpack () {
>      bb.build.exec_func('base_do_unpack', d)
>
>      bb.data.setVar("BINFILE",
> "omap3530_h264enc_2_01_013_production.bin", d)
> -    bb.data.setVar("TARFILE",
> "h264enc_dm6467_1_20_00_08/omap3530_h264enc_2_01_013_production.tar",
> d)
> +    bb.data.setVar("TARFILE",
> + "omap3530_h264enc_2_01_013_production.tar", d)
>      bb.build.exec_func('ti_bin_do_unpack', d)
>
>      bb.data.setVar("BINFILE",
> "omap3530_h264dec_2_01_007_production.bin", d)
> -    bb.data.setVar("TARFILE",
> "omap3530_h264dec_2_01_007_production/omap3530_h264dec_2_01_007_produc
> t
> ion.tar", d)
> +    bb.data.setVar("TARFILE",
> + "omap3530_h264dec_2_01_007_production.tar", d)
>      bb.build.exec_func('ti_bin_do_unpack', d)
>
>      bb.data.setVar("BINFILE",
> "omap3530_jpegenc_02_01_01_00_production.bin", d)
> -    bb.data.setVar("TARFILE",
> "omap3530_jpegenc_02_01_01_00_production/omap3530_jpegenc_02_01_01_00_
> p
> roduction.tar", d)
> +    bb.data.setVar("TARFILE",
> + "omap3530_jpegenc_02_01_01_00_production.tar", d)
>      bb.build.exec_func('ti_bin_do_unpack', d)
>
>      bb.data.setVar("BINFILE",
> "c64xplus_jpegdec_02_00_01_01_production.bin", d)
> -    bb.data.setVar("TARFILE",
> "c64xplus_jpegdec_02_00_01_01_production/c64xplus_jpegdec_02_00_01_01_
> p
> roduction.tar", d)
> +    bb.data.setVar("TARFILE",
> + "c64xplus_jpegdec_02_00_01_01_production.tar", d)
>      bb.build.exec_func('ti_bin_do_unpack', d)
>
>      bb.data.setVar("BINFILE",
> "c64xplus_mpeg2dec_02_00_02_00_production.bin", d)
> -    bb.data.setVar("TARFILE",
> "c64xplus_mpeg2dec_02_00_02_00_production/c64xplus_mpeg2dec_02_00_02_0
> 0
> _production.tar", d)
> +    bb.data.setVar("TARFILE",
> + "c64xplus_mpeg2dec_02_00_02_00_production.tar", d)
>      bb.build.exec_func('ti_bin_do_unpack', d)
>
>      bb.data.setVar("BINFILE",
> "omap3530_mpeg4enc_02_04_00_00_production.bin", d)
> -    bb.data.setVar("TARFILE",
> "omap3530_mpeg4enc_02_04_00_00_production/omap3530_mpeg4enc_02_04_00_0
> 0
> _production.tar", d)
> +    bb.data.setVar("TARFILE",
> + "omap3530_mpeg4enc_02_04_00_00_production.tar", d)
>      bb.build.exec_func('ti_bin_do_unpack', d)
>
>      bb.data.setVar("BINFILE",
> "c64xplus_mpeg4dec_02_01_00_00_production.bin", d)
> -    bb.data.setVar("TARFILE",
> "h264enc_dm6467_1_20_00_08/c64xplus_mpeg4dec_02_01_00_00_production.ta
> r
> ", d)
> +    bb.data.setVar("TARFILE",
> + "c64xplus_mpeg4dec_02_01_00_00_production.tar", d)
>      bb.build.exec_func('ti_bin_do_unpack', d)
>
>      bb.data.setVar("BINFILE",
> "c64xplus_aachedec_01_30_03_00_production.bin", d)
> -    bb.data.setVar("TARFILE",
> "c64xplus_aachedec_01_30_03_00_production/dm6446_aachedec_01_30_03_00_
> p
> roduction.tar", d)
> +    bb.data.setVar("TARFILE",
> + "dm6446_aachedec_01_30_03_00_production.tar", d)
>      bb.build.exec_func('ti_bin_do_unpack', d)
>
>      bb.data.setVar("BINFILE",
> "c64xplus_g711_1_12_00_000_production.bin", d)
> -    bb.data.setVar("TARFILE",
> "h264enc_dm6467_1_20_00_08/dm6446_g711enc_1_12_00_000_production.tar",
> d)
> +    bb.data.setVar("TARFILE",
> + "dm6446_g711enc_1_12_00_000_production.tar", d)
>      bb.build.exec_func('ti_bin_do_unpack', d)
>
>      bb.data.setVar("BINFILE",
> "c64xplus_g711_1_12_00_000_production.bin", d)
> -    bb.data.setVar("TARFILE",
> "h264enc_dm6467_1_20_00_08/dm6446_g711dec_1_12_00_000_production.tar",
> d)
> +    bb.data.setVar("TARFILE",
> + "dm6446_g711dec_1_12_00_000_production.tar", d)
>      bb.build.exec_func('ti_bin_do_unpack', d)
>
>      bb.data.setVar("BINFILE",
> "c64xplus_deinterlacer_01_00_00_07_production.bin", d)
> --
> 1.7.6.4
>
>
Texas Instruments Limited, 800 Pavilion Drive, Northampton, NN4 7YL. Regist=
ered in England & Wales under company number 00574102

_______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti




