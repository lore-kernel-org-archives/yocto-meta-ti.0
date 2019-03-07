Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 23462E00D01; Thu,  7 Mar 2019 14:50:12 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 89C44E00CED
	for <meta-ti@yoctoproject.org>; Thu,  7 Mar 2019 14:50:11 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x27MoBJ4031299
	for <meta-ti@yoctoproject.org>; Thu, 7 Mar 2019 16:50:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551999011;
	bh=pIh2XvCBNmYAClEd7tsCAO5eJTzYOckvHs0vNgyQrRM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Q7yYy9yuUFANYe1TLPmNC8JcUX3lxZKWezIk4E/RfK3KiQnHhmQ3dcslO9R9WYGzG
	OORMzGja7VVjcgp7gR7XxNLl/e8DIk0jI1PK5J7MMwpgY5c5/+LtnrVxaVMGFeP69r
	c26ZCxRZNJ17DgoIyvlNKJLbx7L1mCL575gF839Q=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x27MoA6w065070
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 7 Mar 2019 16:50:10 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Thu, 7 Mar 2019 16:50:10 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Thu, 7 Mar 2019 16:50:10 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x27MoA5J001331;
	Thu, 7 Mar 2019 16:50:10 -0600
Date: Thu, 7 Mar 2019 17:50:10 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
Message-ID: <20190307225010.GK26081@beryl>
References: <1551751426-10598-1-git-send-email-m-radhakrishnan2@ti.com>
	<1551751426-10598-2-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
In-Reply-To: <1551751426-10598-2-git-send-email-m-radhakrishnan2@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [rocko/master][PATCH v2] gcc-arm-none-eabi-native: Update to 7.0-2018-q2-update
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
X-List-Received-Date: Thu, 07 Mar 2019 22:50:12 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Mar 04, 2019 at 09:03:46PM -0500, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  ....bb => gcc-arm-none-eabi-native_7-2018-q2-update.bb} | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
>  rename recipes-ti/devtools/{gcc-arm-none-eabi-native_6-2017-q1-update.bb => gcc-arm-none-eabi-native_7-2018-q2-update.bb} (47%)
> 
> diff --git a/recipes-ti/devtools/gcc-arm-none-eabi-native_6-2017-q1-update.bb b/recipes-ti/devtools/gcc-arm-none-eabi-native_7-2018-q2-update.bb
> similarity index 47%
> rename from recipes-ti/devtools/gcc-arm-none-eabi-native_6-2017-q1-update.bb
> rename to recipes-ti/devtools/gcc-arm-none-eabi-native_7-2018-q2-update.bb
> index 1140f27..c5f76aa 100644
> --- a/recipes-ti/devtools/gcc-arm-none-eabi-native_6-2017-q1-update.bb
> +++ b/recipes-ti/devtools/gcc-arm-none-eabi-native_7-2018-q2-update.bb
> @@ -1,17 +1,20 @@
>  DESCRIPTION = "Baremetal GCC for ARM"
>  LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
>  
> -LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=c224e429f53a1a6ce70bf8986ea2990b"
> +LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=f77466c63f5787f4bd669c402aabe061"

Probably another benign version change that causes checksum difference, but 
needs to be verified and explained. Thanks.


>  inherit native
>  require recipes-ti/includes/ti-paths.inc
>  
> -SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/6_1-2017q1/gcc-arm-none-eabi-6-2017-q1-update-linux.tar.bz2;name=gcc-arm-none"
> +SRC_URI = "https://developer.arm.com/-/media/Files/downloads/gnu-rm/7-2018q2/gcc-arm-none-eabi-7-2018-q2-update-linux.tar.bz2;name=gcc-arm-none"
>  
> -SRC_URI[gcc-arm-none.md5sum] = "30004c24f4632bc594952462bb0cd1c9"
> -SRC_URI[gcc-arm-none.sha256sum] = "e7aad2579f02e3b095c6d7899ca5e6a70cfa9b8a8cbd6abd868da849d416c2eb"
> +SRC_URI[gcc-arm-none.md5sum] = "299ebd3f1c2c90930d28ab82e5d8d6c0"
> +SRC_URI[gcc-arm-none.sha256sum] = "bb17109f0ee697254a5d4ae6e5e01440e3ea8f0277f2e8169bf95d07c7d5fe69"
>  
> -S = "${WORKDIR}/gcc-arm-none-eabi-6-2017-q1-update"
> +S = "${WORKDIR}/gcc-arm-none-eabi-7-2018-q2-update"
> +
> +# only x86_64 is supported
> +COMPATIBLE_HOST = "x86_64.*-linux"
>  
>  do_install() {
>      install -d ${D}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}
> @@ -20,4 +23,6 @@ do_install() {
>  
>  FILES_${PN} = "${GCC_ARM_NONE_TOOLCHAIN_RECIPE}/*"
>  
> -INSANE_SKIP_${PN} = "already-stripped"
> +INSANE_SKIP_${PN} = "already-stripped libdir staticdev"
> +
> +BBCLASSEXTEND = "native nativesdk"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

