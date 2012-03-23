Return-Path: <denis@denix.org>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 84C88E0044D
	for <meta-ti@yoctoproject.org>; Fri, 23 Mar 2012 10:51:56 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M1C005ASMYAV6D1@vms173009.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 23 Mar 2012 12:51:52 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 4AEFA201F9; Fri,
	23 Mar 2012 13:51:46 -0400 (EDT)
Date: Fri, 23 Mar 2012 13:51:46 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Tom Rini <trini@ti.com>
Message-id: <20120323175146.GF13495@denix.org>
References: <1331235244-5173-1-git-send-email-trini@ti.com>
	<1332524217-27534-3-git-send-email-trini@ti.com>
	<20120323173802.GH9551@bill-the-cat>
MIME-version: 1.0
In-reply-to: <20120323173802.GH9551@bill-the-cat>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2 3/4] omap3evm.conf: Use '+=' not '?=' in IMAGE_FSTYPES
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
X-List-Received-Date: Fri, 23 Mar 2012 17:51:56 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Mar 23, 2012 at 10:38:02AM -0700, Tom Rini wrote:
> On Fri, Mar 23, 2012 at 10:36:56AM -0700, Tom Rini wrote:
> 
> > Signed-off-by: Tom Rini <trini@ti.com>
> > ---
> >  conf/machine/omap3evm.conf |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> Code is correct, commit message wasn't updated.  v3 or can someone just
> fix before pushing?  Thanks!

I'm not sure the discussion at OE-Core is over... The way I read it, Richard 
would rather see MACHINE_IMAGES_FSTYPES implemented, instead of using 
overrides in local.conf.

-- 
Denys

