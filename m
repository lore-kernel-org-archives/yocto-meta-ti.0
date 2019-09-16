Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CD558E00C74; Mon, 16 Sep 2019 10:29:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
	BODY_QUOTE_MALF_MSGID, DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  2.0 BODY_QUOTE_MALF_MSGID Malformed MSGID with quote
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 34B98E007C9
	for <meta-ti@yoctoproject.org>; Mon, 16 Sep 2019 10:29:00 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8GHSxWI111674;
	Mon, 16 Sep 2019 12:28:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568654939;
	bh=qwsjfnYhoJsOAU2eEcPsukhoMGn4O7E8siH/q5RcXJ4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=VDwwHemxD9gFng+YoIGbSRb1GxxyiAOTm7Y3EjlA1JomWKjH35sHP7Wl61V6WjC/8
	VJ4Vf/IUrqbT8lsqn79ayNjgYxfPa37iTbDSIvrOgSeDUIJH2JDNw0PojkoymcY3ky
	d/94+k29EYDxwICsmuQxkAQMBE3eK/QbXjvjRPes=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8GHSxrU085301
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Sep 2019 12:28:59 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 16 Sep 2019 12:28:56 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 16 Sep 2019 12:28:56 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8GHSwpL116779;
	Mon, 16 Sep 2019 12:28:58 -0500
Date: Mon, 16 Sep 2019 13:28:58 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: <Kevin.E.Cribbs@L3Harris.com>
Message-ID: <20190916172857.GE26975@beryl>
References: <CY1P110MB04703E6886F03EF65BC06EFFE8B00@CY1P110MB0470.NAMP110.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <CY1P110MB04703E6886F03EF65BC06EFFE8B00@CY1P110MB0470.NAMP110.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: meta-ti (a345e0c2) Linux kernel fails to boot on Beagleboard-xM (rev C)
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
X-List-Received-Date: Mon, 16 Sep 2019 17:29:01 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Sep 12, 2019 at 03:14:33PM +0000, Kevin.E.Cribbs@L3Harris.com wrote:
> I created a Yocto Project Bugzilla bug (13517) for this problem. Randy 
> MacLeod said "meta-ti is not tracked in this bugzilla. Please contact the 
> BSP owner".

> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13517
> 
> What is the correct procedure for reporting problems with the meta-ti layer?

Kevin,

Thank you for the report.

Regarding the use of Yocto Project bugzilla for metat-ti bugs - I've discussed 
this with fellow Yocto Project TSC members and there's a confusion caused by 
limited resources. We'll try to get this sorted out...

Meanwhile, as of the booting issue itself. As you can see, meta-ti uses TI 
"staging" tree, where active development for current and latest platforms 
happens during the upstreaming process. OMAP3 SOC is 10-15 years old and what 
is called a legacy device. It has been fully supported in mainline Linux 
kernel for many years. Yes, TI is also responsible for maintaining existing 
support in the mainline kernel and ensuring no regressions. But that is not 
against the TI "staging" tree - i.e. there's no active testing being done of 
meta-ti working on OMAP3 platforms like Beagleboard-xM, unfortunately. This is 
left to corresponding communities, such as Beagleboard.org

I'll see what I can do to get this looked at in meta-ti. Otherwise, do you see 
any issues using a mainline kernel for your platform? Thanks.

-- 
Denys

