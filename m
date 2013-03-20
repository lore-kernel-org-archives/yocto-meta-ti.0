Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 310FCE00740
	for <meta-ti@yoctoproject.org>; Wed, 20 Mar 2013 12:11:41 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MJZ009QW3YKNDT1@vms173005.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 20 Mar 2013 14:11:24 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 542802018B; Wed,
	20 Mar 2013 15:11:08 -0400 (EDT)
Date: Wed, 20 Mar 2013 15:11:08 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Denys Dmytriyenko <denys@ti.com>
Message-id: <20130320191108.GQ14761@denix.org>
References: <5148A9B4.5060702@comcast.net> <20130319182747.GH14761@denix.org>
	<5149C666.7040306@comcast.net> <20130320151759.GP14761@denix.org>
	<5149F665.9090204@comcast.net> <20130320175415.GW32759@edge>
	<5149FD74.3030906@comcast.net> <20130320182722.GX32759@edge>
	<alpine.DEB.2.02.1303201441410.28378@oneiric>
	<20130320185747.GY32759@edge>
MIME-version: 1.0
In-reply-to: <20130320185747.GY32759@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Is this the correct list for AM3517 EVM questions?
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
X-List-Received-Date: Wed, 20 Mar 2013 19:11:41 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Mar 20, 2013 at 02:57:47PM -0400, Denys Dmytriyenko wrote:
> On Wed, Mar 20, 2013 at 02:45:17PM -0400, Robert P. J. Day wrote:
> > On Wed, 20 Mar 2013, Denys Dmytriyenko wrote:
> > 
> > ... snip ...
> > 
> > > If you are using poky-danny as a base, you need to use "danny"
> > > branch of meta-ti to match the versions.
> > 
> >   i ordered that very AM3517 exp kit this morning and, while it's
> > in transit, i'm building a core-image-minimal for it. should i expect
> > success if i use the absolute latest "git pull"s of everything?
> > 
> >   i'm aware of the recipe masking issue and the mesa-dri version thing
> > so i won't trip over that. so far, the "fetchall" worked and i'm
> > currently on "running tasks (191 of 1591)" of the build itself.
> > 
> >   is there any reason to think this shouldn't finish? thanks.
> 
> http://article.gmane.org/gmane.linux.embedded.yocto.meta-ti/1661

Oh, and "danny" results are on the meta-arago mailing list, although those are 
for the entire SDK, but much more green overall... :)

-- 
Denys

