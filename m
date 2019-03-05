Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CD3BCE00D24; Mon,  4 Mar 2019 17:48:19 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 183CAE00D11
	for <meta-ti@yoctoproject.org>; Mon,  4 Mar 2019 17:48:19 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x251mIws076081
	for <meta-ti@yoctoproject.org>; Mon, 4 Mar 2019 19:48:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551750498;
	bh=f8UhnOAWKkoR/ylpfFZHPdki8Gka/KJg5RrAtPJOdBc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=vt/iDF27b04nDkz+YLup64j6B9Qy1a8aujkgy0qB52lgpuXlx2iWeR0Ms9o+JPOkY
	B0uSt0CHrUUZYY6O7WdZh2/4usTWXYN76iq5wErCUoy5ycyLtvcw9b62B5dRHDBp7/
	tWM19aS6e+A2myUIKGUEHDYgVHOPSDF03U9GXBqw=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x251mI7e106014
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 4 Mar 2019 19:48:18 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 4 Mar 2019 19:48:18 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 4 Mar 2019 19:48:18 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x251mIna013181;
	Mon, 4 Mar 2019 19:48:18 -0600
Date: Mon, 4 Mar 2019 20:48:17 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
Message-ID: <20190305014817.GV26081@beryl>
References: <1551749965-9481-1-git-send-email-m-radhakrishnan2@ti.com>
	<1551749965-9481-2-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
In-Reply-To: <1551749965-9481-2-git-send-email-m-radhakrishnan2@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [rocko/master][PATCH] ti-cgt6x: Update to version 8.3.2
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
X-List-Received-Date: Tue, 05 Mar 2019 01:48:19 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Mar 04, 2019 at 08:39:25PM -0500, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  .../{ti-cgt6x_8.2.2.bb => ti-cgt6x_8.3.2.bb}       | 28 +++++++---------------
>  1 file changed, 8 insertions(+), 20 deletions(-)
>  rename recipes-ti/devtools/{ti-cgt6x_8.2.2.bb => ti-cgt6x_8.3.2.bb} (72%)
> 
> diff --git a/recipes-ti/devtools/ti-cgt6x_8.2.2.bb b/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
> similarity index 72%
> rename from recipes-ti/devtools/ti-cgt6x_8.2.2.bb
> rename to recipes-ti/devtools/ti-cgt6x_8.3.2.bb
> index 53f5252..90106e5 100644
> --- a/recipes-ti/devtools/ti-cgt6x_8.2.2.bb
> +++ b/recipes-ti/devtools/ti-cgt6x_8.3.2.bb
> @@ -2,8 +2,8 @@ DESCRIPTION = "TI DSP Code Generation Tools"
>  HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
>  LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT & BSD-2-Clause & PD"
>  
> -LIC_FILES_CHKSUM = "file://ti-cgt-c6000_${PV}/C6000_8.2.x_CodeGenerationTools_Manifest.htm;md5=66147c95fc5d3f900b73414f8258c91e"
> -LIC_FILES_CHKSUM_class-target = "file://usr/share/doc/ti/cgt-c6x/C6000_8.2.x_CodeGenerationTools_Manifest.htm;md5=66147c95fc5d3f900b73414f8258c91e"
> +LIC_FILES_CHKSUM = "file://ti-cgt-c6000_${PV}/C6000CodeGenerationTools_8.3.x_manifest.html;md5=d06c6f9acebf78df4108a8535396e9f1"
> +LIC_FILES_CHKSUM_class-target = "file://usr/share/doc/ti/cgt-c6x/C6000CodeGenerationTools_8.3.x_manifest.html;md5=d06c6f9acebf78df4108a8535396e9f1"

Please briefly mention reason for license checksum change in the commit log.


>  PE = "1"
>  
> @@ -37,11 +37,11 @@ BINFILE_NAME_class-target = "cgt6x_arm_installer"
>  
>  SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/C6000/${PV}/${BINFILE};name=${BINFILE_NAME}"
>  
> -SRC_URI[cgt6x_x86_installer.md5sum] = "548c841b231c2fbd954218d4e370c995"
> -SRC_URI[cgt6x_x86_installer.sha256sum] = "f269e51eb29de2efd32b3ea93beebd7b00a1a156c923be1a33ba7d785c4c6a24"
> +SRC_URI[cgt6x_x86_installer.md5sum] = "f1f534e6a4bdee6df39e8d0cb458d161"
> +SRC_URI[cgt6x_x86_installer.sha256sum] = "1fba2a8f5532b33a23677771d686a866171ce7a0e567fed50d900d0ecd2e17e6"
>  
> -SRC_URI[cgt6x_arm_installer.md5sum] = "56f5e5464ab87af517a6cdd5fed06f3f"
> -SRC_URI[cgt6x_arm_installer.sha256sum] = "4b2e605a4afc3d4d0ac74013ee32496541abf093aedd70bc7ef040597933b1ea"
> +SRC_URI[cgt6x_arm_installer.md5sum] = "425d82308e71202ad004a36b7ec3cec9"
> +SRC_URI[cgt6x_arm_installer.sha256sum] = "70c387ddde379194fed712087be6cb0ca5f4f0e65d7f29bd7462c38ee011928f"
>  
>  do_install() {
>      install -d ${D}${bindir}
> @@ -54,10 +54,7 @@ do_install() {
>          install -m 755 ${binfile} ${D}${datadir}/ti/cgt-c6x/bin
>      done
>  
> -    install -d ${D}${datadir}/ti/cgt-c6x/include
> -    for includefile in ${S}/ti-cgt-c6000_${PV}/include/*; do
> -        install -m 644 ${includefile} ${D}${datadir}/ti/cgt-c6x/include
> -    done
> +    cp -r  ${S}/ti-cgt-c6000_${PV}/include ${D}${datadir}/ti/cgt-c6x/include 

If not using install, please pass correct options to cp to avoid host 
contamination warnings.


>      install -d ${D}${datadir}/ti/cgt-c6x/lib
>      for libfile in ${S}/ti-cgt-c6000_${PV}/lib/*.a; do
> @@ -72,11 +69,6 @@ do_install() {
>          install -m 644 ${libfile} ${D}${datadir}/ti/cgt-c6x/lib
>      done
>  
> -    install -d ${D}${datadir}/ti/cgt-c6x/lib/src
> -    for srcfile in ${S}/ti-cgt-c6000_${PV}/lib/src/*; do
> -        install -m 644 ${srcfile} ${D}${datadir}/ti/cgt-c6x/lib/src
> -    done
> -
>      install -d ${D}${datadir}/man/man1
>      for manfile in ${S}/ti-cgt-c6000_${PV}/man/man1/*; do
>          if [ -e ${manfile} ]; then
> @@ -89,7 +81,7 @@ do_install() {
>          install -m 644 ${docfile} ${D}${datadir}/doc/ti/cgt-c6x
>      done
>  
> -    for docfile in ${S}/ti-cgt-c6000_${PV}/*.htm; do
> +    for docfile in ${S}/ti-cgt-c6000_${PV}/*.html; do
>          install -m 644 ${docfile} ${D}${datadir}/doc/ti/cgt-c6x
>      done
>  
> @@ -97,10 +89,6 @@ do_install() {
>          install -m 644 ${docfile} ${D}${datadir}/doc/ti/cgt-c6x
>      done
>  
> -    for docfile in ${S}/ti-cgt-c6000_${PV}/doc/*; do
> -        install -m 644 ${docfile} ${D}${datadir}/doc/ti/cgt-c6x
> -    done
> -
>  }
>  
>  do_install_class-target() {
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

