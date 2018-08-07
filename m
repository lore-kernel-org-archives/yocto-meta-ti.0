Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 09A3EE00C3C; Tue,  7 Aug 2018 09:00:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AF64DE00D94
	for <meta-ti@yoctoproject.org>; Tue,  7 Aug 2018 09:00:06 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w77G050Y126709
	for <meta-ti@yoctoproject.org>; Tue, 7 Aug 2018 11:00:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1533657605;
	bh=Vtp2Us7AGsMGAH/5pRoYXkr+pY0tIcEzBuxVds7qYnU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=E4gJVX6i1uYugsFPQRpdMSggfxuI3oMY54Yvv0DyGTshn3Q4LAydCFnMufpQOExh3
	LyM3qdDOQ936ME79TvuThMINwClUtSve8wyaD9llbe5HBZZfJI6a4o5ITf9yJJ0EWe
	aQ6UBJX7ngDzcCtHjZ+MeObYGjR9wb1iI3qhkuGE=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w77G05Cs032145
	for <meta-ti@yoctoproject.org>; Tue, 7 Aug 2018 11:00:05 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 7 Aug 2018 11:00:05 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 7 Aug 2018 11:00:05 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w77G05ti011128;
	Tue, 7 Aug 2018 11:00:05 -0500
Date: Tue, 7 Aug 2018 11:58:53 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jianzhong Xu <xuj@ti.com>
Message-ID: <20180807155853.GH18078@beryl>
References: <1533653146-29074-1-git-send-email-xuj@ti.com>
MIME-Version: 1.0
In-Reply-To: <1533653146-29074-1-git-send-email-xuj@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/3] Added SWTOOLS which is needed to build processor libs (DSPLIB, MATHLIB, etc) from source.
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
X-List-Received-Date: Tue, 07 Aug 2018 16:00:28 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Aug 07, 2018 at 10:45:44AM -0400, Jianzhong Xu wrote:
> Signed-off-by: Jianzhong Xu <xuj@ti.com>
> ---
>  recipes-ti/swtools/swtools_git.bb | 45 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 recipes-ti/swtools/swtools_git.bb
> 
> diff --git a/recipes-ti/swtools/swtools_git.bb b/recipes-ti/swtools/swtools_git.bb
> new file mode 100644
> index 0000000..bd4c005
> --- /dev/null
> +++ b/recipes-ti/swtools/swtools_git.bb
> @@ -0,0 +1,45 @@
> +DESCRIPTION = "TI Software Tools"

SUMMARY


> +HOMEPAGE = "https://bitbucket.itg.ti.com/projects/PROC_LIBS/repos/swtools/browse"

No bitbucket links


> +SECTION = "devel"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://ti/mas/swtools/copyright.txt;md5=b1f52a1435051fdb18f8885b0384147d"
> +
> +require ../includes/ti-paths.inc
> +
> +DEPENDS = "ti-cgt6x-native \
> +           ti-sysbios \ 
> +           ti-xdctools-native"
> +
> +PV = "5_0_8"
> +PR = "r0"
> +S = "${WORKDIR}/git"
> +BRANCH = "master"
> +SRC_URI = "git://git.ti.com/ep-processor-libraries/swtools.git;protocol=git;branch=${BRANCH}"
> +SRCREV = "881267836907de650edadc56b8e57ab45428021d"
> +
> +export C64PCODEGENTOOL="${CGTOOLS_INSTALL_DIR}"
> +export C674CODEGENTOOL="${CGTOOLS_INSTALL_DIR}"
> +export C66CODEGENTOOL ="${CGTOOLS_INSTALL_DIR}"
> +
> +PATH_append = ":${XDC_INSTALL_DIR}"
> +XDCPATH.="${XDCCGROOT}/include;${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages;"

Both of these lines do similar things of appending a string, but using 
different syntax. It's not an issues, but I was wondering if it was on 
purpose...

Also would be nice to keep spacing and indentation consistent. I.e. bitbake 
assignment operators have spaces around them, unlike shell.


> +export XDCPATH
> +
> +do_compile() {
> +	cd ${S}/ti/mas/swtools
> +	xdc
> +}
> +
> +do_install() {
> +    CP_ARGS="-Prf --preserve=mode,timestamps --no-preserve=ownership"
> +    install -d ${D}${SWTOOLS_INSTALL_DIR_RECIPE}
> +    cp -pPrf ${S}/* ${D}${SWTOOLS_INSTALL_DIR_RECIPE}
> +}
> +
> +FILES_${PN}-dev += "${SWTOOLS_INSTALL_DIR_RECIPE}"
> +
> +INSANE_SKIP_${PN}-dev = "arch staticdev"
> +ALLOW_EMPTY_${PN} = "1"
> +
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

