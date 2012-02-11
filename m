Return-Path: <denis@denix.org>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 107AFE003E4
	for <meta-ti@yoctoproject.org>; Fri, 10 Feb 2012 20:04:12 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LZ700CFYNAPNVT0@vms173009.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 10 Feb 2012 22:04:02 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 48D7420272; Fri,
	10 Feb 2012 23:03:57 -0500 (EST)
Date: Fri, 10 Feb 2012 23:03:57 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: "Monk, Roger" <r-monk@ti.com>
Message-id: <20120211040357.GC2525@denix.org>
References: <1328013657-2069-1-git-send-email-bigotp@acm.org>
	<4C82F39BABFE6A429733A300DEBF52240B5AC841@DNCE02.ent.ti.com>
MIME-version: 1.0
In-reply-to: <4C82F39BABFE6A429733A300DEBF52240B5AC841@DNCE02.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 0/4] Resubmit TI DSP build issues related to installer
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
X-List-Received-Date: Sat, 11 Feb 2012 04:04:13 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Feb 01, 2012 at 12:45:03AM +0000, Monk, Roger wrote:
> Hi Peter,
> 
> On Tue, Jan 31, 2012 at 12:40:53, Peter A. Bigot wrote:
> > Subject: [meta-ti] [PATCH 0/4] Resubmit TI DSP build issues related to
> > installer
> >
> > From: "Peter A. Bigot" <bigotp@acm.org>
> >
> > This patch set re-submits the (updated) uncommitted parts of my
> > 27Dec2011 patch set to get gstreamer-ti and its dependencies to build
> > in a pristine work environment.  It was left back on 29Dec2011 with:
> >
> > > I'm going to wait for Roger to get back from holidays to comment on
> > the installer issues, I'll push the CE and dmai patches later today.
> >
> 
> Thanks for re-basing/re-submitting - sorry this has taken a while.  Your 
> patches look good - however, I have some other failing installer scenarios 
> like these for which I have a similar, but unfortunately, not the same 
> patchset, in progress.  I hope to review yours in the coming days if ok.

Roger,

Were you able to look into this issue and review Peter's patches and/or merge 
with your work? Please let me know if you are making progress and new more 
time. Thanks for your time and support!

-- 
Denys

