Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DC6A1E0076C; Thu, 25 Sep 2014 09:20:21 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AC774E0074B
	for <meta-ti@yoctoproject.org>; Thu, 25 Sep 2014 09:20:12 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8PGK7EE015700;
	Thu, 25 Sep 2014 11:20:07 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8PGK6er028207;
	Thu, 25 Sep 2014 11:20:07 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 25 Sep 2014 11:20:06 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8PGK5H5020465;
	Thu, 25 Sep 2014 11:20:05 -0500
Date: Thu, 25 Sep 2014 12:20:05 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Diego Sueiro <diego.sueiro@gmail.com>
Message-ID: <20140925162004.GA6303@edge>
References: <1411405491-30435-1-git-send-email-denis@denix.org>
	<CAMCfZKHU6GkJMrKBUHJbPttyoKvnb0xqDAEHxysi-W-B1U3scQ@mail.gmail.com>
	<20140924155211.GZ6303@edge>
	<CAMCfZKGPy3mLD_4_4ZJCHQs-=3HjvMk6KkD8Z8_HFhi=jmMhVw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMCfZKGPy3mLD_4_4ZJCHQs-=3HjvMk6KkD8Z8_HFhi=jmMhVw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] linux-ti-staging: update to 3.14.19 with latest fixes
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
X-List-Received-Date: Thu, 25 Sep 2014 16:20:21 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Sep 25, 2014 at 09:04:58AM -0300, Diego Sueiro wrote:
> On Wed, Sep 24, 2014 at 12:52 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> 
> > Do you need to submit a bug report? Is it for kernel or some other
> > component?
> 
> Not at all.
> Just thinking about to have a place where I can easily track issues, solved
> bugs and enhancements for both kernel and u-boot projects. I wish I could
> have an idea on what to expect from TI's work.

Well, this is meant to be an internal release and a staging area. The official 
deliverable for the community is the mainline, although that takes longer time 
for everything to get upstreamed and accepted in to the mainline... There is, 
of course, an internal resource for tracking everything, but I don't think 
it's meant for public consumption...


> The gitorious web interface is the worst available for opensource projects.

I prefer gitweb interface myself:

http://git.ti.com/gitweb/

-- 
Denys

