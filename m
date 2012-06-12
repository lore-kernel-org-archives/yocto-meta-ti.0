Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5A9FEE006D9
	for <meta-ti@yoctoproject.org>; Tue, 12 Jun 2012 10:58:31 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.48.117.33])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M5I006MAN93H533@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 12 Jun 2012 12:58:16 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 41A0C200AC; Tue,
	12 Jun 2012 13:58:14 -0400 (EDT)
Date: Tue, 12 Jun 2012 13:58:14 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: William Mills <wmills@ti.com>
Message-id: <20120612175814.GC32573@denix.org>
References: <20120612011706.GD30300@denix.org> <4FD73FC9.7010002@ti.com>
MIME-version: 1.0
In-reply-to: <4FD73FC9.7010002@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: RFC: creating "extras" layer
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Jun 2012 17:58:32 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Jun 12, 2012 at 09:10:33AM -0400, William Mills wrote:
> On 06/11/2012 09:17 PM, Denys Dmytriyenko wrote:
> >The initial split (which is still "work in progress"), following the above
> >description (except the systemd for now) can be checked at:
> >
> >http://arago-project.org/git/?p=meta-ti.git;a=shortlog;h=refs/heads/split
> 
> I'm glad to see this work going.
> 
> I was surprised to see that the extra layer was embedded into the
> existing one.  Is that right?
> 
> When we talked before we spoke of two layers at the top level.

It should work fine. Making both of them at the top level kind of implies you 
can use one or another. Since extras is always dependent on the main layer, it 
makes sense to embed it in. Plus this way it's less namespace polluting...

-- 
Denys

