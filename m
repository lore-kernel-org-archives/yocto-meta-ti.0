Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B185FE0078E; Mon,  4 Aug 2014 17:20:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	T_HDRS_LCASE,T_MANY_HDRS_LCASE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.23 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 T_HDRS_LCASE Odd capitalization of message header
	* 0.0 T_MANY_HDRS_LCASE Odd capitalization of multiple message headers
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 76816E004DD
	for <meta-ti@yoctoproject.org>; Mon,  4 Aug 2014 17:20:13 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [72.66.25.89])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N9T009II4XDB6G0@vms173023.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 04 Aug 2014 19:20:01 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 23DF82016D; Mon,
	04 Aug 2014 20:20:00 -0400 (EDT)
Date: Mon, 04 Aug 2014 20:20:00 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Message-id: <20140805002000.GB2572@denix.org>
References: <1406684113-18232-1-git-send-email-denis@denix.org>
	<CAP71WjwdFhrz=c-RJHyte7vLRVSex1DxBX=4nR7DHJVHY64BXA@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAP71WjwdFhrz=c-RJHyte7vLRVSex1DxBX=4nR7DHJVHY64BXA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 1/2] linux-ti-staging: add Darren's SGX patches to make graphics work with 3.14
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
X-List-Received-Date: Tue, 05 Aug 2014 00:20:18 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Aug 05, 2014 at 01:24:18AM +0200, Nicolas Dechesne wrote:
> Hi,
> 
> On Wed, Jul 30, 2014 at 3:35 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> > diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-kernel/linux/linux-ti-staging_3.14.bb
> > index b505640..c223c88 100644
> > --- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
> > +++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
> > @@ -3,8 +3,6 @@ DESCRIPTION = "Linux kernel for TI devices"
> >  LICENSE = "GPLv2"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
> >
> > -DEFAULT_PREFERENCE = "-1"
> > -
> 
> i just noticed this change ^^. Was this intentional? This is a big
> change which could have been in its own commit, or at least should
> have been mentioned in the commit log... as it is it was lost in the
> noise..

Yes, it was intentional.

As a matter of fact, it was always a goal to have the latest kernel as the 
default in meta-ti, to help with testing and stabilizing. The only reason it 
was temporarily set at lower priority is to the breakacge with SGX drivers:

http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=15b808a92754e242018e456dfa56738e3075c7ce

Since SGX breakage was resolved recently, it was again marked as default.
Was there anything else broken for you?

-- 
Denys

