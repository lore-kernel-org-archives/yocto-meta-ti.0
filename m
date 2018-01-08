Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5D643E00DA9; Mon,  8 Jan 2018 11:29:13 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 249E6E008FB
	for <meta-ti@yoctoproject.org>; Mon,  8 Jan 2018 11:29:09 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w08JT8dk020851;
	Mon, 8 Jan 2018 13:29:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1515439748;
	bh=XlAe1de/ERzPTchS43m+L47o12X05tRFsMyoFtvbhi0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=uJYrvaBurIyVJHVvL0zIooKqhLaei11kjKkEOLbfnFKC55eoPtRLj2F9bOCpdUWnX
	efF8s+ftvTz4cM24DsWwwUAYKcSN/hm45+JPsiqvKhmO+ISQ0zP6Rvwfwj6k1TIi9B
	KwkOII12YPZrHGplEv8j0Ci+NEPYAzNFVjn5FQiA=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w08JT8E1014127;
	Mon, 8 Jan 2018 13:29:08 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 8 Jan 2018 13:29:08 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 8 Jan 2018 13:29:08 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w08JT8Lg005100;
	Mon, 8 Jan 2018 13:29:08 -0600
Date: Mon, 8 Jan 2018 14:29:07 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Joshua Watt <jpewhacker@gmail.com>
Message-ID: <20180108192907.GP5984@edge>
References: <1513663292-22396-1-git-send-email-denis@denix.org>
	<1513663292-22396-3-git-send-email-denis@denix.org>
	<1515177203.665.44.camel@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1515177203.665.44.camel@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [rocko/master][PATCH 3/4] openmp-rtos: depend on doxygen-native for documentation
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
X-List-Received-Date: Mon, 08 Jan 2018 19:29:13 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Jan 05, 2018 at 12:33:23PM -0600, Joshua Watt wrote:
> On Tue, 2017-12-19 at 01:01 -0500, Denys Dmytriyenko wrote:
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  recipes-ti/openmp-rtos/openmp-rtos_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/recipes-ti/openmp-rtos/openmp-rtos_git.bb b/recipes-
> > ti/openmp-rtos/openmp-rtos_git.bb
> > index f5bf476..df082ea 100644
> > --- a/recipes-ti/openmp-rtos/openmp-rtos_git.bb
> > +++ b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
> > @@ -19,7 +19,7 @@ SRCREV = "a2a518dcc9154a372b38bd5be8a483359123823c"
> >  
> >  LIC_FILES_CHKSUM =
> > "file://docs/license/omp_manifest_template.html;md5=61a6972303c0447b7
> > c056195d7ebafee"
> >  
> > -DEPENDS = "common-csl-ip-rtos ti-xdctools ti-ipc-rtos ti-sysbios ti-
> > cgt6x-native libulm zip-native"
> > +DEPENDS = "common-csl-ip-rtos doxygen-native libulm ti-xdctools ti-
> > ipc-rtos ti-sysbios ti-cgt6x-native zip-native"
> >  DEPENDS_append_k2hk = " qmss-lld-rtos cppi-lld-rtos"
> >  DEPENDS_append_k2e = " qmss-lld-rtos cppi-lld-rtos"
> >  DEPENDS_append_k2l-evm = " qmss-lld-rtos cppi-lld-rtos"
> > -- 
> > 2.7.4
> > 
> Can we backport this to morty please?

This change requires adding doxygen recipe to meta-ti, which is a new feature 
and not a simple bugfix. It's probably too late for adding new stuff to morty. 

Do you have specific issues with the way it used to work in morty? Since there 
weren't RSS or HOSTTOOLS restrictions in morty, host-wide doxygen install used 
to work just fine then.

-- 
Denys

