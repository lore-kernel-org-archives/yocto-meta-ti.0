Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 97D29E009CF; Tue,  4 Sep 2018 12:26:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 37C81E008FF
	for <meta-ti@yoctoproject.org>; Tue,  4 Sep 2018 12:26:22 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w84JQLHl018993
	for <meta-ti@yoctoproject.org>; Tue, 4 Sep 2018 14:26:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536089181;
	bh=R6fpXFCiEfY0elCCnEpugChtk80xc7hm3OZZQSKazZk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=imMb7F56oQOgpcTiCrU1fFOeQ2eFzjMbZEEQ1JjIyBpWRtq9A8a4VRRFxCMwYMqEy
	xajNs6haTnRNTZph2cw3W7KUjAgSTYoPWfXWe84xaOdI+QLdv5i3CYNNQdQ9mI7ABW
	wjQSgxndnDsh3T4Juj7Lr6uV4CxWjZ+zy9D6Q0AQ=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w84JQL4t009186
	for <meta-ti@yoctoproject.org>; Tue, 4 Sep 2018 14:26:21 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 4 Sep 2018 14:26:21 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 4 Sep 2018 14:26:21 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w84JQLbo028075;
	Tue, 4 Sep 2018 14:26:21 -0500
Date: Tue, 4 Sep 2018 15:24:46 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Tinku Mannan <tmannan@ti.com>
Message-ID: <20180904192446.GB13472@beryl>
References: <1536088885-8938-1-git-send-email-tmannan@ti.com>
MIME-Version: 1.0
In-Reply-To: <1536088885-8938-1-git-send-email-tmannan@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [rocko/master][PATCH] Updating to version 01.00.00.13
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
X-List-Received-Date: Tue, 04 Sep 2018 19:26:22 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

The patch body seems to be missing.


On Tue, Sep 04, 2018 at 03:21:24PM -0400, Tinku Mannan wrote:
> Updating to use COPYING.txt as license checksum file
> Also updating md5 checksum for COPYING.txt
> 
> Tinku Mannan (1):
>   icss-emac-lld: Updating to version 01.00.00.13
> 
>  recipes-bsp/icss-emac-lld/icss-emac-lld.inc | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

