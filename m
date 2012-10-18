Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1E76FE01275
	for <meta-ti@yoctoproject.org>; Thu, 18 Oct 2012 09:32:24 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MC300N5BKL20201@vms173011.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 18 Oct 2012 11:32:05 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 168792008D; Thu,
	18 Oct 2012 12:31:49 -0400 (EDT)
Date: Thu, 18 Oct 2012 12:31:49 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: =?iso-8859-1?Q?Herv=E9?= Fache <h-fache@ti.com>
Message-id: <20121018163149.GA20902@denix.org>
References: <20121018162306.343A752AB7@arago-project.org>
	<50802E0E.9000206@ti.com>
MIME-version: 1.0
In-reply-to: <50802E0E.9000206@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: =?UTF-8?B?UmU6IEhlcnbDqSBGYWNoZSA6IGxpbnV4LW9tYXA0OiB1cGRhdGUgdG8gMy40IGZyb20gR0xQIDEuNi4gNiByZWxlYXNl?=
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
X-List-Received-Date: Thu, 18 Oct 2012 16:32:24 -0000
Content-type: text/plain; charset=iso-8859-1
Content-disposition: inline
Content-transfer-encoding: 8bit

On Thu, Oct 18, 2012 at 06:27:58PM +0200, Hervé Fache wrote:
> In my tree, I kept the kernel and used Enrico's recent patches for
> DCE/GST... Maybe some of them could be merged too?

Yes, I'm keeping an eye on your tree and noticed you applied Enrico's patches. 
As well as couple commits from Nicolas. Please let me know the status for all 
those from your perspective. I'll do some basic testing on my side, but if you 
and Nicolas give your blessing for those changes, I'd be happy to merge them 
to meta-ti. Thanks.

-- 
Denys


> On 10/18/2012 06:23 PM, Arago Project git wrote:
> > Module: meta-ti
> > Branch: master
> > Commit: 4f3522a9dc7f04e2f650199d66badb08dad214c6
> > URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=4f3522a9dc7f04e2f650199d66badb08dad214c6
> >
> > Author: Hervé Fache <h-fache@ti.com>
> > Date:   Fri Oct  5 14:57:42 2012 +0200
> >
> > linux-omap4: update to 3.4 from GLP 1.6.6 release
> >
> > Used Herve's version as a base with some mods from Enrico and additional fixes
> > on top, defconfig is the validated one from GLP release.
> >
> > Signed-off-by: Hervé Fache <h-fache@ti.com>
> > Cc: Enrico Butera <ebutera@users.berlios.de>
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >
> > ---
> >
> >  .../linux/linux-omap4-3.4/pandaboard/defconfig     | 4152 ++++++++++++++++++++
> >  recipes-kernel/linux/linux-omap4_3.4.bb            |   17 +
> >  2 files changed, 4169 insertions(+), 0 deletions(-)
> >
> > Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=4f3522a9dc7f04e2f650199d66badb08dad214c6
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

