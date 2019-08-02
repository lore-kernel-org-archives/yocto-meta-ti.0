Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 346FCE00AE6; Fri,  2 Aug 2019 16:38:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8837AE0097C
	for <meta-ti@yoctoproject.org>; Fri,  2 Aug 2019 16:38:33 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x72NcX0d111707
	for <meta-ti@yoctoproject.org>; Fri, 2 Aug 2019 18:38:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1564789113;
	bh=26Nc2cyOIuq5DmQVgxnQPVX7C/bMLqznHt7/a77BrlM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=nzfPoq2UtWf3ZrPgN29KITlzZudte5ob/hqipmHjqV4YzTeG85P0Eyr+fdQP3dV44
	STL0OjLTR3pC8LRGc/JbQLYy5DYWv22NW7JXf9YQf+1fXN51kP5ISPBUxGIuq4tsra
	ZG/JMWlfMRDeFvH7gSprqe3VaUpYovzUvRomgAwI=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x72NcW5r118406
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 2 Aug 2019 18:38:32 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 2 Aug 2019 18:38:32 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 2 Aug 2019 18:38:32 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x72NcW73113517;
	Fri, 2 Aug 2019 18:38:32 -0500
Date: Fri, 2 Aug 2019 19:38:32 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
Message-ID: <20190802233832.GZ20944@beryl>
References: <1564768898-23436-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
In-Reply-To: <1564768898-23436-1-git-send-email-m-radhakrishnan2@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [thud/master][PATCH] ti-cgt-pru: Update to version 2.3.2
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
X-List-Received-Date: Fri, 02 Aug 2019 23:38:34 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

This breaks nativesdk - please test.


On Fri, Aug 02, 2019 at 02:01:38PM -0400, Mahesh Radhakrishnan wrote:
> The License Checksum has changed due to version, the licenses have not
> changed
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  recipes-ti/devtools/{ti-cgt-pru_2.2.1.bb => ti-cgt-pru_2.3.2.bb} | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename recipes-ti/devtools/{ti-cgt-pru_2.2.1.bb => ti-cgt-pru_2.3.2.bb} (83%)
> 
> diff --git a/recipes-ti/devtools/ti-cgt-pru_2.2.1.bb b/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb
> similarity index 83%
> rename from recipes-ti/devtools/ti-cgt-pru_2.2.1.bb
> rename to recipes-ti/devtools/ti-cgt-pru_2.3.2.bb
> index 8d3887e..73a767e 100644
> --- a/recipes-ti/devtools/ti-cgt-pru_2.2.1.bb
> +++ b/recipes-ti/devtools/ti-cgt-pru_2.3.2.bb
> @@ -2,8 +2,8 @@ DESCRIPTION = "TI PRU Code Generation Tools"
>  HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
>  LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT & BSD-2-Clause & PD"
>  
> -LIC_FILES_CHKSUM = "file://ti-cgt-pru_${PV}/PRU_Code_Generation_Tools_2.2.x_manifest.html;md5=e84b4022808f66b075095cb896747758"
> -LIC_FILES_CHKSUM_class-target = "file://usr/share/doc/ti/cgt-pru/PRU_Code_Generation_Tools_2.2.x_manifest.html;md5=e84b4022808f66b075095cb896747758"
> +LIC_FILES_CHKSUM = "file://ti-cgt-pru_${PV}/PRU_Code_Generation_Tools_2.3.x_manifest.html;md5=e22f9d8240f7cca0c0aa5242d9ffa5bc"
> +LIC_FILES_CHKSUM_class-target = "file://usr/share/doc/ti/cgt-pru/PRU_Code_Generation_Tools_2.3.x_manifest.html;md5=e22f9d8240f7cca0c0aa5242d9ffa5bc"
>  
>  require recipes-ti/includes/ti-paths.inc
>  require recipes-ti/includes/ti-unpack.inc
> @@ -18,8 +18,8 @@ BINFILE_NAME_class-target = "cgt-pru-arm"
>  
>  SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/PRU/${PV}/${BINFILE};name=${BINFILE_NAME}"
>  
> -SRC_URI[cgt-pru-x86.md5sum] = "749d75841eef7b465c7cb08beaa1d135"
> -SRC_URI[cgt-pru-x86.sha256sum] = "7dc37fd689d1d506bf410d2a00af658b93a58d4bc10ac32c2210129dab617377"
> +SRC_URI[cgt-pru-x86.md5sum] = "270a0ecca383f66cad3a0e2a738c6ab0"
> +SRC_URI[cgt-pru-x86.sha256sum] = "af1178a059d46d67d5672df053dd2fbebb0b89a513b17b8739dbe915b4a5d71a"
>  
>  SRC_URI[cgt-pru-arm.md5sum] = "389eef56777e30e6dab337efca4af2bf"
>  SRC_URI[cgt-pru-arm.sha256sum] = "b47a032f67cb3a3e5bea8ee3ed1908038f42938dd08e2ff72fc64f7aae2c1ff8"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

