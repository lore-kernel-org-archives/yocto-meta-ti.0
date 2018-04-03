Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B35ECE00BA1; Tue,  3 Apr 2018 14:00:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2EA72E008D2
	for <meta-ti@yoctoproject.org>; Tue,  3 Apr 2018 14:00:49 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w33L0nh0026924
	for <meta-ti@yoctoproject.org>; Tue, 3 Apr 2018 16:00:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1522789249;
	bh=cpN5bpW/1S5pTOpOsx/4vGN5PGf7bBa2fKE4x8Mc2BU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=AGizUsbj8m4TOlBLsfgMbFvwnLcWLEsYwWnoy/oX8r2hfAgdZNS6RDeGfilo9b4c+
	vSp7y76IRFMRX/1dQIKdcyExrt9Gw1lmkJYtBhRy/Y89l4K/KpdXrzPnq8XInPOP54
	P1ggVCMJoIn3rMs9S5cfgEcAA20Py3vgldkZ4t1o=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w33L0n24009514
	for <meta-ti@yoctoproject.org>; Tue, 3 Apr 2018 16:00:49 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 3 Apr 2018 16:00:49 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 3 Apr 2018 16:00:49 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w33L0md2019641;
	Tue, 3 Apr 2018 16:00:49 -0500
Date: Tue, 3 Apr 2018 17:00:48 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Ruei, Eric" <e-ruei1@ti.com>
Message-ID: <20180403210048.GF31973@edge>
References: <1521074745-42435-1-git-send-email-e-ruei1@ti.com>
	<4ece286e-ecc2-4ff9-8239-13183b53f1de@email.android.com>
	<b04f4f1375bb454fbbee4d113e31a0ce@ti.com>
	<ed137a3d-d432-41d9-ac41-1a493ba8f7a1@email.android.com>
MIME-Version: 1.0
In-Reply-To: <ed137a3d-d432-41d9-ac41-1a493ba8f7a1@email.android.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [rocko/master][PATCH v3] ti-sgx-ddk-km: update SGX kernel	driver for k4.14
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
X-List-Received-Date: Tue, 03 Apr 2018 21:00:50 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Eric,

ping


On Thu, Mar 15, 2018 at 12:59:41AM +0000, Dmytriyenko, Denys wrote:
> Absolutely
> 
> 
> 
> On Mar 14, 2018 17:58, "Ruei, Eric" <e-ruei1@ti.com> wrote:
> Hi, Denys:
> 
> I see that the v2 is in.
> Should I submit this one on top of v2 as a new patch?
> 
> Best regards,
> 
> Eric
> 
> 
> From: Dmytriyenko, Denys
> Sent: Wednesday, March 14, 2018 8:51 PM
> To: Ruei, Eric
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [rocko/master][PATCH v3] ti-sgx-ddk-km: update SGX kernel driver for k4.14
> 
> It's already in rocko/master - no rebases
> 
> 
> 
> On Mar 14, 2018 17:46, "Ruei, Eric" <e-ruei1@ti.com<mailto:e-ruei1@ti.com>> wrote:
> From: Anand Balagopalakrishnan <anandb@ti.com<mailto:anandb@ti.com>>
> 
> Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com<mailto:anandb@ti.com>>
> Signed-off-by: Eric Ruei <e-ruei1@ti.com<mailto:e-ruei1@ti.com>>
> ---
>  recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
> index 0303797..55f6b9b 100644
> --- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
> +++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
> @@ -20,7 +20,7 @@ RPROVIDES_${PN} = "omapdrm-pvr"
>  RREPLACES_${PN} = "omapdrm-pvr"
>  RCONFLICTS_${PN} = "omapdrm-pvr"
> 
> -BRANCH = "ti-img-sgx/${PV}/k4.9"
> +BRANCH = "ti-img-sgx/${PV}/k4.14"
> 
>  SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH} \
>  file://0001-srvkm-common-devicemem.c-suppress-implicit-fallthrou.patch<file:///\\0001-srvkm-common-devicemem.c-suppress-implicit-fallthrou.patch> \
> @@ -28,7 +28,7 @@ file://0001-srvkm-common-devicemem.c-suppress-implicit-fallthrou.patch<file:///\\0001-srvkm-common-devicemem.c-suppress-implicit-fallthrou.patch> \
> 
>  S = "${WORKDIR}/git"
> 
> -SRCREV = "0086977380d3320d70a3abc78b95fa0641427073"
> +SRCREV = "b144fa4b97cb69e54cabaad62daffcd4b5497c29"
> 
>  TARGET_PRODUCT_omap-a15 = "jacinto6evm"
>  TARGET_PRODUCT_ti33x = "ti335x"
> --
> 1.9.1
> 
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>
> https://lists.yoctoproject.org/listinfo/meta-ti

> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


