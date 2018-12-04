Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DDD15E00C75; Tue,  4 Dec 2018 13:05:37 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED,T_FILL_THIS_FORM_SHORT
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	*  0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal
	*      information
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9B372E00C5F
	for <meta-ti@yoctoproject.org>; Tue,  4 Dec 2018 13:05:35 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id wB4L5Zjh100944
	for <meta-ti@yoctoproject.org>; Tue, 4 Dec 2018 15:05:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543957535;
	bh=TayZBdl5VXR5xrGfEiTooZkdpWpph0UI3vZ3XNm6BxE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=azbejcJmU8lA+kafT4qUeJCfSxcIZdXBonfuLpGNQwZ5ecyW/P4jVQd3x576yH9ef
	LBEgJAm/3W/wuwefxNmZ0bZT2cJmd4NxaaXt6JtwYyesvyLsHg9dnkpBZvshbWH38X
	hvcQuSPd3NIgDmgHzsrwWfL4bezXVL6Eh/OoMxSg=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wB4L5ZH2048583
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 4 Dec 2018 15:05:35 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 4 Dec 2018 15:05:34 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 4 Dec 2018 15:05:34 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wB4L5YjN018736;
	Tue, 4 Dec 2018 15:05:34 -0600
Date: Tue, 4 Dec 2018 16:05:34 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jianzhong Xu <xuj@ti.com>
Message-ID: <20181204210534.GT6887@beryl>
References: <1543953714-14447-1-git-send-email-xuj@ti.com>
MIME-Version: 1.0
In-Reply-To: <1543953714-14447-1-git-send-email-xuj@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2] DSPLIB/MATHLIB packaging everything including hidden folders
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
X-List-Received-Date: Tue, 04 Dec 2018 21:05:37 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack

On Tue, Dec 04, 2018 at 03:01:54PM -0500, Jianzhong Xu wrote:
> 1. Package everything including hidden folders for dsplib and mathlib  
> 2. Update SRCREVs for dsplib and mathlib related to Proc-SDK 5.2 bug fixes.
> 
> Signed-off-by: Jianzhong Xu <xuj@ti.com>
> ---
>  recipes-ti/dsplib/dsplib.inc   | 8 ++++----
>  recipes-ti/mathlib/mathlib.inc | 8 ++++----
>  2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/recipes-ti/dsplib/dsplib.inc b/recipes-ti/dsplib/dsplib.inc
> index f369679..95cd034 100644
> --- a/recipes-ti/dsplib/dsplib.inc
> +++ b/recipes-ti/dsplib/dsplib.inc
> @@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
>  
>  require ../includes/ti-paths.inc
>  
> -PV = "3_4_0_1"
> +PV = "3_4_0_2"
>  PR = "r0"
>  
>  DEPENDS = "ti-cgt6x-native \
> @@ -17,7 +17,7 @@ DEPENDS = "ti-cgt6x-native \
>  S = "${WORKDIR}/git"
>  
>  SRC_URI = "git://git.ti.com/ep-processor-libraries/dsplib.git;protocol=git;branch=master"
> -SRCREV = "bf5a51cba462c5cb03ed20a6a1bb1bd16c0683e1"
> +SRCREV = "0eb7e849c4cf0ffbfd67e2a777e655375822792b"
>  
>  LIC_FILES_CHKSUM = "file://ti/dsplib/src/common/c66/lnk.cmd;beginline=1;endline=37;md5=0f0c9c4d51d8af75419781591ace190b"
>  
> @@ -48,7 +48,7 @@ do_install() {
>  	install -d ${D}${DSPLIB_INSTALL_DIR_RECIPE}
>  
>  	find -name "${DSPLIB_PACKAGE_NAME}.zip" -exec unzip -o {} -d ${D}${DSPLIB_INSTALL_DIR_RECIPE} \;
> -	mv ${D}${DSPLIB_INSTALL_DIR_RECIPE}/dsplib/* ${D}${DSPLIB_INSTALL_DIR_RECIPE}
> +	cp -r ${D}${DSPLIB_INSTALL_DIR_RECIPE}/dsplib/. ${D}${DSPLIB_INSTALL_DIR_RECIPE}
>  	rm -r ${D}${DSPLIB_INSTALL_DIR_RECIPE}/dsplib
>  }
>  
> @@ -60,7 +60,7 @@ do_deploy() {
>  	# zip up files in ${D}${DSPLIB_INSTALL_DIR_RECIPE}
>  	# and place the zip file in ${DEPLOYDIR}
>  	mkdir ./${DSPLIB_PACKAGE_NAME}
> -	cp -r ${D}${DSPLIB_INSTALL_DIR_RECIPE}/* ./${DSPLIB_PACKAGE_NAME}
> +	cp -r ${D}${DSPLIB_INSTALL_DIR_RECIPE}/. ./${DSPLIB_PACKAGE_NAME}
>  	zip -9 -y -r -q ${DEPLOYDIR}/${DSPLIB_PACKAGE_NAME}.zip ./${DSPLIB_PACKAGE_NAME}
>  	rm -r ./${DSPLIB_PACKAGE_NAME}
>  }
> diff --git a/recipes-ti/mathlib/mathlib.inc b/recipes-ti/mathlib/mathlib.inc
> index 6aea085..3792f4d 100644
> --- a/recipes-ti/mathlib/mathlib.inc
> +++ b/recipes-ti/mathlib/mathlib.inc
> @@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
>  
>  require ../includes/ti-paths.inc
>  
> -PV = "3_1_2_2"
> +PV = "3_1_2_3"
>  PR = "r0"
>  
>  DEPENDS = "ti-cgt6x-native \
> @@ -17,7 +17,7 @@ DEPENDS = "ti-cgt6x-native \
>  S = "${WORKDIR}/git"
>  
>  SRC_URI = "git://git.ti.com/ep-processor-libraries/mathlib.git;protocol=git;branch=master"
> -SRCREV = "195355db20f53295cfeef0bcfba0a8d8fdb0a753"
> +SRCREV = "8ca923210d156aa09f582aaab0dc2d0174a88962"
>  
>  LIC_FILES_CHKSUM = "file://ti/mathlib/src/acosdp/acosdp.h;beginline=1;endline=35;md5=c133f7e139b46385906c861dd9552250"
>  
> @@ -47,7 +47,7 @@ do_install() {
>  	install -d ${D}${MATHLIB_INSTALL_DIR_RECIPE}
>  
>  	find -name "${MATHLIB_PACKAGE_NAME}.zip" -exec unzip -o {} -d ${D}${MATHLIB_INSTALL_DIR_RECIPE} \;
> -	mv ${D}${MATHLIB_INSTALL_DIR_RECIPE}/mathlib/* ${D}${MATHLIB_INSTALL_DIR_RECIPE}
> +	cp -r ${D}${MATHLIB_INSTALL_DIR_RECIPE}/mathlib/. ${D}${MATHLIB_INSTALL_DIR_RECIPE}
>  	rm -r ${D}${MATHLIB_INSTALL_DIR_RECIPE}/mathlib
>  }
>  
> @@ -59,7 +59,7 @@ do_deploy() {
>  	# zip up files in ${D}${MATHLIB_INSTALL_DIR_RECIPE}
>  	# and place the zip file in ${DEPLOYDIR}
>  	mkdir ./${MATHLIB_PACKAGE_NAME}
> -	cp -r ${D}${MATHLIB_INSTALL_DIR_RECIPE}/* ./${MATHLIB_PACKAGE_NAME}
> +	cp -r ${D}${MATHLIB_INSTALL_DIR_RECIPE}/. ./${MATHLIB_PACKAGE_NAME}
>  	zip -9 -y -r -q ${DEPLOYDIR}/${MATHLIB_PACKAGE_NAME}.zip ./${MATHLIB_PACKAGE_NAME}
>  	rm -r ./${MATHLIB_PACKAGE_NAME}
>  }
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

