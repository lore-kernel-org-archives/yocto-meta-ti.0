Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DF294E00BB7; Mon,  3 Dec 2018 13:24:38 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	T_FILL_THIS_FORM_SHORT autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	*  0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal
	*      information
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 26991E00B77
	for <meta-ti@yoctoproject.org>; Mon,  3 Dec 2018 13:24:37 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id wB3LOb6H003576
	for <meta-ti@yoctoproject.org>; Mon, 3 Dec 2018 15:24:37 -0600
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wB3LObKo052113
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 3 Dec 2018 15:24:37 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 3 Dec 2018 15:24:37 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 3 Dec 2018 15:24:37 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wB3LObWD015108;
	Mon, 3 Dec 2018 15:24:37 -0600
Date: Mon, 3 Dec 2018 16:24:36 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jianzhong Xu <xuj@ti.com>
Message-ID: <20181203212436.GB6887@beryl>
References: <1543866842-36973-1-git-send-email-xuj@ti.com>
MIME-Version: 1.0
In-Reply-To: <1543866842-36973-1-git-send-email-xuj@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] DSPLIB/MATHLIB add install/deploy of .metadata folder
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
X-List-Received-Date: Mon, 03 Dec 2018 21:24:38 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Dec 03, 2018 at 02:54:02PM -0500, Jianzhong Xu wrote:
> Add install/deploy of .metadata folder for dsplib and mathlib packages.

Is that RTOS specific? This was not accepted to meta-ti.


> Update SRCREVs for dsplib and mathlib related to Proc-SDK 5.2 bug fixes.
> 
> Signed-off-by: Jianzhong Xu <xuj@ti.com>
> ---
>  recipes-ti/dsplib/dsplib.inc   | 6 ++++--
>  recipes-ti/mathlib/mathlib.inc | 6 ++++--
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/recipes-ti/dsplib/dsplib.inc b/recipes-ti/dsplib/dsplib.inc
> index f369679..49f1979 100644
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
> @@ -49,6 +49,7 @@ do_install() {
>  
>  	find -name "${DSPLIB_PACKAGE_NAME}.zip" -exec unzip -o {} -d ${D}${DSPLIB_INSTALL_DIR_RECIPE} \;
>  	mv ${D}${DSPLIB_INSTALL_DIR_RECIPE}/dsplib/* ${D}${DSPLIB_INSTALL_DIR_RECIPE}
> +	mv ${D}${DSPLIB_INSTALL_DIR_RECIPE}/dsplib/.metadata ${D}${DSPLIB_INSTALL_DIR_RECIPE}
>  	rm -r ${D}${DSPLIB_INSTALL_DIR_RECIPE}/dsplib
>  }
>  
> @@ -61,6 +62,7 @@ do_deploy() {
>  	# and place the zip file in ${DEPLOYDIR}
>  	mkdir ./${DSPLIB_PACKAGE_NAME}
>  	cp -r ${D}${DSPLIB_INSTALL_DIR_RECIPE}/* ./${DSPLIB_PACKAGE_NAME}
> +	cp -r ${D}${DSPLIB_INSTALL_DIR_RECIPE}/.metadata ./${DSPLIB_PACKAGE_NAME}
>  	zip -9 -y -r -q ${DEPLOYDIR}/${DSPLIB_PACKAGE_NAME}.zip ./${DSPLIB_PACKAGE_NAME}
>  	rm -r ./${DSPLIB_PACKAGE_NAME}
>  }
> diff --git a/recipes-ti/mathlib/mathlib.inc b/recipes-ti/mathlib/mathlib.inc
> index 6aea085..9d4b456 100644
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
> @@ -48,6 +48,7 @@ do_install() {
>  
>  	find -name "${MATHLIB_PACKAGE_NAME}.zip" -exec unzip -o {} -d ${D}${MATHLIB_INSTALL_DIR_RECIPE} \;
>  	mv ${D}${MATHLIB_INSTALL_DIR_RECIPE}/mathlib/* ${D}${MATHLIB_INSTALL_DIR_RECIPE}
> +	mv ${D}${MATHLIB_INSTALL_DIR_RECIPE}/mathlib/.metadata ${D}${MATHLIB_INSTALL_DIR_RECIPE}
>  	rm -r ${D}${MATHLIB_INSTALL_DIR_RECIPE}/mathlib
>  }
>  
> @@ -60,6 +61,7 @@ do_deploy() {
>  	# and place the zip file in ${DEPLOYDIR}
>  	mkdir ./${MATHLIB_PACKAGE_NAME}
>  	cp -r ${D}${MATHLIB_INSTALL_DIR_RECIPE}/* ./${MATHLIB_PACKAGE_NAME}
> +	cp -r ${D}${MATHLIB_INSTALL_DIR_RECIPE}/.metadata ./${MATHLIB_PACKAGE_NAME}
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

