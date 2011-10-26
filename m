Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 60A9CE005BB
	for <meta-ti@yoctoproject.org>; Wed, 26 Oct 2011 00:03:52 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [96.240.135.93])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LTN00CPYVM0VLU4@vms173007.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 26 Oct 2011 02:03:41 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id DFA0B14AF64; Wed,
	26 Oct 2011 03:03:35 -0400 (EDT)
Date: Wed, 26 Oct 2011 03:03:35 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Jason Kridner <jkridner@beagleboard.org>
Message-id: <20111026070335.GD15391@denix.org>
References: <1319587995-11126-1-git-send-email-joelagnel@ti.com>
	<20111026053519.GA15391@denix.org>
	<CA+T6QPmWEKLjZHV=tnQ+OMROc+s9h-TYy31ykoYHs6AzgPS3_A@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CA+T6QPmWEKLjZHV=tnQ+OMROc+s9h-TYy31ykoYHs6AzgPS3_A@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH meta-ti] linux-ti33x-psp 3.1rc8: Enable	usb-to-serial drivers
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
X-List-Received-Date: Wed, 26 Oct 2011 07:03:52 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Oct 26, 2011 at 02:44:16AM -0400, Jason Kridner wrote:
> On Wed, Oct 26, 2011 at 1:35 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> > On Tue, Oct 25, 2011 at 07:13:14PM -0500, Joel A Fernandes wrote:
> >> Enable the PL2303 usb-to-serial driver required for serial output
> >> from the beaglebone tester.
> >
> > BTW, has anyone tried building kernel for am335x-evm lately? It appears broken
> > for me with bunch of unresolved symbols for musb... Doing bisect doesn't help
> > much, as the tree was rebased and no previous revs are available :(
> 
> The lack of previous revs cost me about 24 hours of trying to figure
> out how to fix the repo and waiting for it to fetch, but I have only
> been trying to build for the Bone, not for the EVM.  My builds are
> currently failing on "lzop: command not found".

http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstruments/commit/?id=21d8165f0ab973f0ce0f2588d2e97b99d885c786

make sure to have 'lzop' installed, no native recipe for that yet

-- 
Denys

