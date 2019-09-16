Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B0CCEE00B33; Mon, 16 Sep 2019 09:58:20 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 475A5E007AA
	for <meta-ti@yoctoproject.org>; Mon, 16 Sep 2019 09:58:18 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8GGwIVd079793;
	Mon, 16 Sep 2019 11:58:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568653098;
	bh=42nLMbAgmN6XNrE4cBcSATAIADp//p/doxKHHWoSe3Y=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ctft/EixAFSoSXEY3ykYgzW4FVDB/oNVcznhWvFy4clBN+nZBNPhHGTa2hXrcf/G3
	W0xuBJqxHIWaezKuoIPcVP2K3EJ9sUQ27WciokMBbAYRcC3ALl9vJN+u5PnzujKBjs
	2aaOKWxBMesTNHDiSBmTKfrfNFgaHMlB0LJ6aOgc=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8GGwINT043750;
	Mon, 16 Sep 2019 11:58:18 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 16 Sep 2019 11:58:11 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 16 Sep 2019 11:58:13 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8GGwDWw019315;
	Mon, 16 Sep 2019 11:58:13 -0500
Date: Mon, 16 Sep 2019 12:58:13 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190916165813.GD26975@beryl>
References: <20190914144326.2954755-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190914144326.2954755-1-raj.khem@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] libion: Fix musl build
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
X-List-Received-Date: Mon, 16 Sep 2019 16:58:20 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Khem,

Thanks for the fix. What's the Upstream-Status: ? :)
I guess "Pending" would be appropriate for now.


Andrew,

Would you be willing to take the change in, so we don't have to carry the 
patch in meta-ti, or do you see any issues with it?

-- 
Denys


On Sat, Sep 14, 2019 at 07:43:26AM -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...tead-of-__BEGIN_DECL-__END_DECL-macr.patch | 42 +++++++++++++++++++
>  recipes-devtools/ion/libion_git.bb            |  4 +-
>  2 files changed, 45 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-devtools/ion/libion/0001-Use-extern-C-instead-of-__BEGIN_DECL-__END_DECL-macr.patch
> 
> diff --git a/recipes-devtools/ion/libion/0001-Use-extern-C-instead-of-__BEGIN_DECL-__END_DECL-macr.patch b/recipes-devtools/ion/libion/0001-Use-extern-C-instead-of-__BEGIN_DECL-__END_DECL-macr.patch
> new file mode 100644
> index 00000000..530c869e
> --- /dev/null
> +++ b/recipes-devtools/ion/libion/0001-Use-extern-C-instead-of-__BEGIN_DECL-__END_DECL-macr.patch
> @@ -0,0 +1,42 @@
> +From 197e7bf9a20076c6564a860bd2215e8101ee4cad Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sat, 14 Sep 2019 07:36:47 -0700
> +Subject: [PATCH] Use extern "C" instead of __BEGIN_DECL/__END_DECL macros
> +
> +these macros are defined in sys/cdefs.h for glibc and this header is not available on all libc
> +
> +for glibc they are defined like below
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + include/ion/ion.h | 8 ++++++--
> + 1 file changed, 6 insertions(+), 2 deletions(-)
> +
> +diff --git a/include/ion/ion.h b/include/ion/ion.h
> +index 81ab9cc..e95df4b 100644
> +--- a/include/ion/ion.h
> ++++ b/include/ion/ion.h
> +@@ -24,7 +24,9 @@
> + #include <sys/types.h>
> + #include <linux/ion.h>
> + 
> +-__BEGIN_DECLS
> ++#ifdef __cplusplus
> ++extern "C" {
> ++#endif
> + 
> + int ion_open();
> + int ion_close(int fd);
> +@@ -34,6 +36,8 @@ int ion_free(int fd, int handle_fd);
> + int ion_query_heap_cnt(int fd, int* cnt);
> + int ion_query_get_heaps(int fd, int cnt, void* buffers);
> + 
> +-__END_DECLS
> ++#ifdef __cplusplus
> ++}
> ++#endif
> + 
> + #endif /* __ION_H */
> +-- 
> +2.23.0
> +
> diff --git a/recipes-devtools/ion/libion_git.bb b/recipes-devtools/ion/libion_git.bb
> index 7c93ed3f..38ba9bd8 100644
> --- a/recipes-devtools/ion/libion_git.bb
> +++ b/recipes-devtools/ion/libion_git.bb
> @@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
>  PV = "1.0.0"
>  
>  BRANCH = "master"
> -SRC_URI = "git://github.com/glneo/libion.git;protocol=git;branch=${BRANCH}"
> +SRC_URI = "git://github.com/glneo/libion.git;protocol=git;branch=${BRANCH} \
> +           file://0001-Use-extern-C-instead-of-__BEGIN_DECL-__END_DECL-macr.patch \
> +"
>  SRCREV = "11dad7977ec3ecba37c013da7ec0408c01413000"
>  
>  S = "${WORKDIR}/git"
> -- 
> 2.23.0
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

