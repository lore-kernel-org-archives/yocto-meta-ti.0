Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A2C68E00E0D; Tue, 19 Nov 2019 10:21:52 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4F019E007D4
	for <meta-ti@yoctoproject.org>; Tue, 19 Nov 2019 10:21:51 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAJILl9O076282;
	Tue, 19 Nov 2019 12:21:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1574187707;
	bh=vwIcHDDkztoX/lnUFQYeJ9NvGLnPmAL5fbYsOh9a8Ew=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Z/rWavH8XEX5imtIOeo4h0S0yLDWbtfLNA8QVlM4zzbBiR1UqikoT8XlfOwMtLQsD
	52IY3iA56PFVI8Yr9BZGbb2XSJlFL/u6AdjEnk9q1f0sazShR9zG45LfhyM3lq4ps0
	O+f5LLSXwXnz4iMz2eWPiV2SMUDyLJsMqxhhK+vM=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAJILlnu032331
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 19 Nov 2019 12:21:47 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 19 Nov 2019 12:21:47 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Tue, 19 Nov 2019 12:21:47 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAJILlvo047920;
	Tue, 19 Nov 2019 12:21:47 -0600
Date: Tue, 19 Nov 2019 13:21:47 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Paul Barker <paul@betafive.co.uk>
Message-ID: <20191119182147.GF27719@beryl>
References: <2972340c-d2ba-481b-900c-9c758cb60fde@www.fastmail.com>
MIME-Version: 1.0
In-Reply-To: <2972340c-d2ba-481b-900c-9c758cb60fde@www.fastmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: Backport request for thud
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
X-List-Received-Date: Tue, 19 Nov 2019 18:21:52 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sat, Nov 16, 2019 at 11:43:19AM +0000, Paul Barker wrote:
> I'm currently seeing build failures on the thud branch with meta-ti under 
> Centos 7 and Centos 8. As /lib and /lib64 are links to /usr/lib and 
> /usr/lib64 respectively, the logic in ti-unpack.inc is looking for the 
> 32-bit C library under /lib32 which doesn't exist.
> 
> Could you backport 6f80b1e5595a13eec465581cfb352efcb0286bc8 from master to 
> thud to fix this?

Paul,

I will backport this fix to thud, but currently it's frozen due to a pending 
release. Please give it a week or so. Thanks.

-- 
Denys

