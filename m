Return-Path: <denis@denix.org>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4AA5CE01426
	for <meta-ti@yoctoproject.org>; Thu, 21 Jun 2012 17:24:58 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.48.117.33])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M5Z00KL2T53S8I0@vms173009.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 21 Jun 2012 19:24:39 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 023C220526; Thu,
	21 Jun 2012 20:24:38 -0400 (EDT)
Date: Thu, 21 Jun 2012 20:24:38 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-id: <20120622002438.GE30753@denix.org>
References: <CALbNGRQCVUeZFX_xxVe=3ixZMm7MRt3WWB5VxemNs0Bi+qCHcQ@mail.gmail.com>
	<20120621230216.GD30753@denix.org>
	<CALbNGRQ5CBSDS8zPnkem59mOjzAGDy8FHZifU_g5f9z59yOybg@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CALbNGRQ5CBSDS8zPnkem59mOjzAGDy8FHZifU_g5f9z59yOybg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org, openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: massive fallout after updates / was (no subject)
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
X-List-Received-Date: Fri, 22 Jun 2012 00:24:58 -0000
Content-type: text/plain; charset=iso-8859-1
Content-disposition: inline
Content-transfer-encoding: 8bit

On Fri, Jun 22, 2012 at 01:34:54AM +0200, Andreas Müller wrote:
> On Fri, Jun 22, 2012 at 1:02 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> No need to understand everything: By removing require linux-tools.inc
> (the fastest patch I ever had :) I can now build again.
> 
> @layer maintainers: removing
> 
> require linux-tools.inc
> 
> should be taken into consideration

Thanks!

-- 
Denys

