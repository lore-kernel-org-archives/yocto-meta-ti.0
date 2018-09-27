Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DBDD8E00B6C; Thu, 27 Sep 2018 14:50:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4E850E0090A
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 14:50:45 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RLojbs112022
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 16:50:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538085045;
	bh=mswzy+cf9HQsEIrb6mxhq0d1BCC+wySwpP0TRoGIzps=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=VvAH3fYQN4dVwH5Ff7BzBk0wZqFCdB7p3xVL3mAmEwd6Q0Cumx17lv+1FXYZtpwnX
	zc2b9otIX2jwxBExkll3YYN7SxH+D+EcqhBuR08C9ANB+v2+ru+GqY3qvQBFoJVxpx
	28mEu1z3KDhk679/j3s2FuKlqt4RjoSPnWkuwxb4=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RLoiAj009605
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 16:50:45 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 16:50:44 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 27 Sep 2018 16:50:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RLoiw8018348;
	Thu, 27 Sep 2018 16:50:44 -0500
Date: Thu, 27 Sep 2018 17:50:44 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
Message-ID: <20180927215044.GT8582@beryl>
References: <1538081009-52859-1-git-send-email-m-radhakrishnan2@ti.com>
	<1538081009-52859-29-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
In-Reply-To: <1538081009-52859-29-git-send-email-m-radhakrishnan2@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [rocko/master][PATCH v2 28/30] ti-ndk: Upgrading to 3.40.01.01
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
X-List-Received-Date: Thu, 27 Sep 2018 21:50:45 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Sep 27, 2018 at 04:43:27PM -0400, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  recipes-ti/ndk/ti-ndk_2.26.00.08.bb | 13 -------------
>  recipes-ti/ndk/ti-ndk_3.40.01.01.bb | 13 +++++++++++++

Please make it a diff - pass -C/-M to git format-patch


>  2 files changed, 13 insertions(+), 13 deletions(-)
>  delete mode 100644 recipes-ti/ndk/ti-ndk_2.26.00.08.bb
>  create mode 100644 recipes-ti/ndk/ti-ndk_3.40.01.01.bb
> 
> diff --git a/recipes-ti/ndk/ti-ndk_2.26.00.08.bb b/recipes-ti/ndk/ti-ndk_2.26.00.08.bb
> deleted file mode 100644
> index e587bf9..0000000
> --- a/recipes-ti/ndk/ti-ndk_2.26.00.08.bb
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -require ti-ndk.inc
> -
> -PV = "2_26_00_08"
> -PR = "r0"
> -
> -LIC_FILES_CHKSUM = "file://ndk_${PV}_manifest.html;md5=e2a7d40cf1e7207ac3dd6d993d71ee8c"
> -
> -SRC_URI[ndkzip.md5sum] = "09c7ffaff305f3083d15c0a0db73d781"
> -SRC_URI[ndkzip.sha256sum] = "5b22c6b8bfbf3a22c53f52bf880d5cf49daf386716942a4202569521bb30f4a8"
> -
> -INHIBIT_PACKAGE_STRIP = "1"
> -INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> -INHIBIT_SYSROOT_STRIP = "1"
> diff --git a/recipes-ti/ndk/ti-ndk_3.40.01.01.bb b/recipes-ti/ndk/ti-ndk_3.40.01.01.bb
> new file mode 100644
> index 0000000..4a494b1
> --- /dev/null
> +++ b/recipes-ti/ndk/ti-ndk_3.40.01.01.bb
> @@ -0,0 +1,13 @@
> +require ti-ndk.inc
> +
> +PV = "3_40_01_01"
> +PR = "r0"
> +
> +LIC_FILES_CHKSUM = "file://manifest_ndk_${PV}.html;md5=9ddeee8ab01c13f593e6d085cca46b6a"
> +
> +SRC_URI[ndkzip.md5sum] = "bbbef445f2d2f84f9bee5d297f77d397"
> +SRC_URI[ndkzip.sha256sum] = "e2e5c683c70dfad6f4372c5eeebaf0209b27abb0f77304f14f0359cbc7b3f4b8"
> +
> +INHIBIT_PACKAGE_STRIP = "1"
> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> +INHIBIT_SYSROOT_STRIP = "1"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

