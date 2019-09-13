Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 24F02E00994; Fri, 13 Sep 2019 13:59:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B53C5E0096F
	for <meta-ti@yoctoproject.org>; Fri, 13 Sep 2019 13:59:29 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8DKxTXm020737
	for <meta-ti@yoctoproject.org>; Fri, 13 Sep 2019 15:59:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568408369;
	bh=p9poW1zQA01RctRwhAXbXzOS2HiWyvPaORO0mYPz91U=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Pyhsu/Vnoo3UwSxQI2VwtNDiq3JrEaQt93jSGL84jYIis3AYk1jCQ74VYCXQ8/LW8
	no/aVSS7F0L2YSXzR6iOkhuW2/8yyZL01gAIn3OpCqfmHFBITu4Ty/eJuvL3CPKjsC
	O/yjyqf0N8NWtm9gXLxdTuQt8XY1VOF03wZYMKH0=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8DKxTux091414
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 13 Sep 2019 15:59:29 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 13 Sep 2019 15:59:28 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 13 Sep 2019 15:59:28 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8DKxScN087326;
	Fri, 13 Sep 2019 15:59:28 -0500
Date: Fri, 13 Sep 2019 16:59:28 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: David Huang <d-huang@ti.com>
Message-ID: <20190913205928.GA13929@beryl>
References: <1568408292-13189-1-git-send-email-d-huang@ti.com>
MIME-Version: 1.0
In-Reply-To: <1568408292-13189-1-git-send-email-d-huang@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [thud][PATCH v2] videnc-test-app: Add the videnc-test-app recipe
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
X-List-Received-Date: Fri, 13 Sep 2019 20:59:30 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Sep 13, 2019 at 03:58:12PM -0500, David Huang wrote:
> The videnc-test-app provides the video encoder test app
> (tienc_encode) for j7-evm.
> 
> Signed-off-by: David Huang <d-huang@ti.com>
> ---

v2 changes here?


>  .../ti-img-encode-decode/videnc-test-app_1.0.0.bb      | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
> 
> diff --git a/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb b/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
> new file mode 100644
> index 000000000000..1725da7eb6d9
> --- /dev/null
> +++ b/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "Test applications for TI DEC (v4l2 decoder for IMG D5520)"

Encoder instead of decoder?


> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://main.c;beginline=1;endline=14;md5=3545dd5bdf513840937d38c10b866605"
> +
> +DEPENDS = "libdrm"
> +
> +inherit autotools pkgconfig
> +
> +PR = "r0"
> +SRCREV = "a5e7d820bea1be24f25a8369d4d4521c784f869a"
> +
> +EXTRA_OEMAKE = "CC="${CC}""
> +TARGET_CC_ARCH += "${LDFLAGS}"
> +
> +BRANCH = "master"
> +SRC_URI = "git://git.ti.com/jacinto7_multimedia/videnc-test-app.git;protocol=git;branch=${BRANCH}"
> +
> +S = "${WORKDIR}/git"
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

