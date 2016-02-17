Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5B609E00BEB; Wed, 17 Feb 2016 13:06:02 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 15138E00BE6
	for <meta-ti@yoctoproject.org>; Wed, 17 Feb 2016 13:05:58 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1HL5pe9008231;
	Wed, 17 Feb 2016 15:05:51 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1HL5pVD015812;
	Wed, 17 Feb 2016 15:05:51 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 17 Feb 2016 15:05:51 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1HL5puX028703;
	Wed, 17 Feb 2016 15:05:51 -0600
Date: Wed, 17 Feb 2016 16:05:15 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Bode, Michael (PED-DEAS)" <Michael.Bode@bshg.com>
Message-ID: <20160217210515.GG31480@edge>
References: <5f4fac1f4ae841ad99a481f1ef201f1d@MCHSWIEXMB5A.bsh.corp.bshg.com>
MIME-Version: 1.0
In-Reply-To: <5f4fac1f4ae841ad99a481f1ef201f1d@MCHSWIEXMB5A.bsh.corp.bshg.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Will there be a yocto jethro branch in future?
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
X-List-Received-Date: Wed, 17 Feb 2016 21:06:02 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Feb 17, 2016 at 09:19:30AM +0000, Bode, Michael (PED-DEAS) wrote:
> Hello,
> 
> probably i'm not the first asking this question but i could'nt find any statement.
> I'm working with meta-ti embedded into yocto environment a lot. Really a great stuff.
> From time to time I update the layers according to the yocto releases. So I started from "dora" and shifted to "fido".
> Now I like to update also to "jethro".
> Question: "How is the policy of meta-ti integration regarding yocto releases?" Will there be a "jethro" branch as soon as the layer is compatible or can I assume that as long as there is no "jethro" branch the meta-ti layer is compatible to yocto head?
> If there will be a "jethro" branch, is there a time schedule for this?

As you can see, we skipped dizzy and jethro releases, as we don't have 
resources to maintain 2 releases per year. I try to keep master up to date and 
we plan to intersect the next 2.1 release in April, for which we'll have a new 
branch in meta-ti.

-- 
Denys

