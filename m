Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C4E7EE00D2B; Thu, 21 Mar 2019 13:49:50 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3BF99E00D21
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 13:49:50 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2LKnnM7066087
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 15:49:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553201389;
	bh=9OFUTfA0G3eN9vlE5kSdqO/h6JIuib2bgiLYe62CzS8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=OXFmYcjQ5aWy5TlW4Qn4rrvDDp+axgIeCuNrAyt6qvHtZRuN/rwlBCAkBmQeDucKE
	cilukhYxrwjCc1zQC9cA7RhVqIFVVYFzoYImc1o/hpD3yhWhtcQ3mNwZA08oaDhljC
	0v4Nj2T72QTw4kFnM7dg/TOlyZooDXXkXU4aWWKQ=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2LKnnOq080495
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 15:49:49 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 21 Mar 2019 15:49:49 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend
	Transport; Thu, 21 Mar 2019 15:49:48 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2LKnmnh007502;
	Thu, 21 Mar 2019 15:49:49 -0500
Date: Thu, 21 Mar 2019 16:49:48 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
Message-ID: <20190321204948.GG30002@beryl>
References: <1553174173-28679-1-git-send-email-m-radhakrishnan2@ti.com>
	<1553174173-28679-27-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
In-Reply-To: <1553174173-28679-27-git-send-email-m-radhakrishnan2@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [rocko/master][PATCH 26/29] dsplib: Recipe enhancements to facilitate AUTOREV
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
X-List-Received-Date: Thu, 21 Mar 2019 20:49:50 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Mar 21, 2019 at 09:16:10AM -0400, Mahesh Radhakrishnan wrote:
> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
> ---
>  recipes-ti/dsplib/dsplib.inc | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-ti/dsplib/dsplib.inc b/recipes-ti/dsplib/dsplib.inc
> index 2738fc5..ad47437 100644
> --- a/recipes-ti/dsplib/dsplib.inc
> +++ b/recipes-ti/dsplib/dsplib.inc
> @@ -5,7 +5,7 @@ LICENSE = "BSD-3-Clause"
>  require ../includes/ti-paths.inc
>  
>  PV = "3_4_0_3"
> -PR = "r0"
> +PR = "r1"
>  
>  DEPENDS = "ti-cgt6x-native \
>             ti-xdctools-native \
> @@ -16,8 +16,14 @@ DEPENDS = "ti-cgt6x-native \
>  
>  S = "${WORKDIR}/git"
>  
> -SRC_URI = "git://git.ti.com/ep-processor-libraries/dsplib.git;protocol=git;branch=master"
> -SRCREV = "2cd21a04913648d040bd63234183cc6f81f5286a"
> +DSPLIB_GIT_BRANCH = "master"
> +DSPLIB_GIT_PROTOCOL = "git"
> +DSPLIB_GIT_URI = "git://git.ti.com/ep-processor-libraries/dsplib.git"
> +DSPLIB_SRCREV = "2cd21a04913648d040bd63234183cc6f81f5286a"
> +
> +BRANCH = "${DSPLIB_GIT_BRANCH}"

Same comment for BRANCH being unused.


> +SRC_URI = "${DSPLIB_GIT_URI};protocol=${DSPLIB_GIT_PROTOCOL};branch=${DSPLIB_GIT_BRANCH}"
> +SRCREV = "${DSPLIB_SRCREV}"
>  
>  LIC_FILES_CHKSUM = "file://ti/dsplib/src/common/c66/lnk.cmd;beginline=1;endline=37;md5=0f0c9c4d51d8af75419781591ace190b"
>  
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

