Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2F4EEE00803; Mon, 18 Jan 2016 08:47:12 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E246AE0079A
	for <meta-ti@yoctoproject.org>; Mon, 18 Jan 2016 08:47:05 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0IGkW7U006202;
	Mon, 18 Jan 2016 10:46:32 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0IGkWHf008099;
	Mon, 18 Jan 2016 10:46:32 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 18 Jan 2016 10:46:31 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0IGkVEh026497;
	Mon, 18 Jan 2016 10:46:31 -0600
Date: Mon, 18 Jan 2016 11:46:15 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Troy Benjegerdes <hozer@hozed.org>
Message-ID: <20160118164615.GC4223@edge>
References: <20160116063631.GB10881@nl.grid.coop>
MIME-Version: 1.0
In-Reply-To: <20160116063631.GB10881@nl.grid.coop>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: regression tests for am3517-evm machine?
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
X-List-Received-Date: Mon, 18 Jan 2016 16:47:12 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sat, Jan 16, 2016 at 12:36:31AM -0600, Troy Benjegerdes wrote:
> Are there any regression tests and/or recent builds of a 3.1x or 4.x series
> kernel on an am3517 eval board? The original 'supported' TI SDKs were all
> of the 2.6.x series, and it seems like somewhere along the way something
> broke, and I'm trying to figure out what it was.

Do you have any specifics for the breakage?

-- 
Denys

