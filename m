Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EF5B8E00D17; Fri, 15 Dec 2017 15:00:25 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7C756E00B48
	for <meta-ti@yoctoproject.org>; Fri, 15 Dec 2017 15:00:24 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBFMxp1W006247;
	Fri, 15 Dec 2017 16:59:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513378791;
	bh=CrDTOIGvdf8xRjIaj9zotqN3D1VDboKS+KH8T88qAlQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=o7nrk/WE0WN/pYqUk4z84CSv7zCo9YTtgvpT1IxyySCPQXZ6iSXHhj1dzEjGMEZ4R
	B1nr78qRWuL+swzAmFp5gwldw9CutM1KonpmRxVTAuJQ66cuXq2b8s41v6XMoCb+f1
	0gFLZjvPcy2uGsuBOIfr2uP9CoaatPj2/gRpCk5U=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBFMxkc2030494;
	Fri, 15 Dec 2017 16:59:46 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 15 Dec 2017 16:59:46 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 15 Dec 2017 16:59:46 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBFMxkTK000627;
	Fri, 15 Dec 2017 16:59:46 -0600
Date: Fri, 15 Dec 2017 17:59:46 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Joshua Watt <jpewhacker@gmail.com>
Message-ID: <20171215225945.GD361@edge>
References: <20171128195856.28289-1-JPEWhacker@gmail.com>
	<20171211222857.17997-1-JPEWhacker@gmail.com>
	<20171211223916.GB27197@edge> <1513039988.18435.4.camel@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1513039988.18435.4.camel@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org, "Mertz, Timothy" <timothy.mertz@garmin.com>
Subject: Re: [morty][PATCH v2] Make ti-xdctools a native recipe
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
X-List-Received-Date: Fri, 15 Dec 2017 23:00:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Dec 11, 2017 at 06:53:08PM -0600, Joshua Watt wrote:
> On Mon, 2017-12-11 at 17:39 -0500, Denys Dmytriyenko wrote:
> > Thanks! Can you please detail the changes between v1 and v2 of the
> > patch? We 
> > are still investigating v1 of the patch and how it affects our
> > releases...
> 
> Sorry, just rebased and took the opertunity to add the branch specifier
> (morty) to the patch subject since I forgot it the first time. There
> are no functional changes.

Thanks, have you tried building anything with this change?

Right off the bat it breaks ipumm-fw, as it expects xdctools to reside in the 
same sysroot as BIOS, which is the target one. Fixing it.

Also, I'm making corresponding changes in meta-arago, which uses xdctools as 
well. Hopefully there's not much breakage there...

-- 
Denys

