Return-Path: <denys@TI.COM>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 07128E00D4D; Tue, 18 Oct 2016 09:37:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C6212E00D49
	for <meta-ti@yoctoproject.org>; Tue, 18 Oct 2016 09:37:54 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u9IGbf7L023395;
	Tue, 18 Oct 2016 11:37:41 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9IGbfYr018365;
	Tue, 18 Oct 2016 11:37:41 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 18 Oct 2016 11:37:40 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u9IGbene022739;
	Tue, 18 Oct 2016 11:37:40 -0500
Date: Tue, 18 Oct 2016 12:37:40 -0400
From: Denys Dmytriyenko <denys@TI.COM>
To: Gary Thomas <gary@mlbassoc.com>
Message-ID: <20161018163739.GY12745@edge>
References: <22ae15ea-bbf0-2e73-e344-d62019bf34e1@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <22ae15ea-bbf0-2e73-e344-d62019bf34e1@mlbassoc.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: capemgr and/or device tree overlays
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
X-List-Received-Date: Tue, 18 Oct 2016 16:37:58 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Oct 18, 2016 at 11:34:40AM +0200, Gary Thomas wrote:
> How can I enable/use either the bone_capemgr or device tree
> overlays on my BeagleBoneBlack using the linux-ti-staging-4.4.23
> kernel from meta-ti/master?

Not [yet] supported in meta-ti.

-- 
Denys

