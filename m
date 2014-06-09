Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 586E0E00C35; Mon,  9 Jun 2014 11:36:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	T_HDRS_LCASE,T_MANY_HDRS_LCASE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.21 listed in list.dnswl.org]
	*  0.0 T_HDRS_LCASE Odd capitalization of message header
	* 0.0 T_MANY_HDRS_LCASE Odd capitalization of multiple message headers
X-Greylist: delayed 3604 seconds by postgrey-1.32 at yocto-www;
	Mon, 09 Jun 2014 11:35:50 PDT
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9DAD4E00B66
	for <meta-ti@yoctoproject.org>; Mon,  9 Jun 2014 11:35:50 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N6W008N1WUPJ440@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 09 Jun 2014 12:35:24 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 86D8620120; Mon,
	09 Jun 2014 13:35:13 -0400 (EDT)
Date: Mon, 09 Jun 2014 13:35:13 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Diego Sueiro <diego.sueiro@gmail.com>
Message-id: <20140609173513.GM27324@denix.org>
References: <5392397D.4000504@emagii.com>
	<7fe72dbd-40a2-4730-a737-ac67ef21c9a1@email.android.com>
	<5392BE20.2000509@emagii.com> <5394FEA0.1020602@emagii.com>
	<CAMCfZKHYWGdStwbGVjnfqC3O3zj5j4qPmsq9jH=U9s_a92EtRA@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAMCfZKHYWGdStwbGVjnfqC3O3zj5j4qPmsq9jH=U9s_a92EtRA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: Building qt5 using Yocto+meta-ti possible for Beaglebone?
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
X-List-Received-Date: Mon, 09 Jun 2014 18:36:03 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Jun 09, 2014 at 07:04:17AM -0300, Diego Sueiro wrote:
> Ulf,
> 
> On Sun, Jun 8, 2014 at 9:24 PM, Ulf Samuelsson <meta-ti@emagii.com> wrote:
> 
> > Romber Nelson and some other people mention that the 3.12 kernel used is
> > not compatible with the advanced capes like LCDs.
> > Do I need to revert to the 3.8 kernel?
> >
> 
> Kernel 3.12 does not have cape manager capabilities, as far as I know.
> Did you tested it in a HDMI monitor/TV?

Correct, cape support is not available in 3.12.

-- 
Denys

