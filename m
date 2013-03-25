Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 94585E013A7
	for <meta-ti@yoctoproject.org>; Mon, 25 Mar 2013 06:59:20 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MK700FJSYTTG1M1@vms173003.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 25 Mar 2013 08:58:54 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B609420092; Mon,
	25 Mar 2013 09:58:41 -0400 (EDT)
Date: Mon, 25 Mar 2013 09:58:41 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Frazer, Will" <will.frazer@eurotech.com>
Message-id: <20130325135841.GE30363@denix.org>
References: <53BEB60EC8F56A4B8CCD9F7C4F8CFC7A4905862C@DBXPRD0510MB358.eurprd05.prod.outlook.com>
MIME-version: 1.0
In-reply-to: <53BEB60EC8F56A4B8CCD9F7C4F8CFC7A4905862C@DBXPRD0510MB358.eurprd05.prod.outlook.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Recipes from arago
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
X-List-Received-Date: Mon, 25 Mar 2013 13:59:20 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Mar 25, 2013 at 12:33:54PM +0000, Frazer, Will wrote:
> Hi All,
> 
> There are a couple of recipes in meta-arago that I want to pull into my 
> build (ti-wifi-utils, crda etc) that don't exist in meta-ti. I was wondering 
> what the preferred way to use these with my poky build is. I haven't used 
> the arago layer previously & at a quick test, the recipe check stage moans 
> about the linaro toolchain. It doesn't seem like I ought to be adding that 
> layer but I'm open to suggestions.

meta-arago-extras should be distro-agnostic and work with e.g. Poky.

But I haven't tried it recently in that setup and wouldn't be surprised if 
something there is pulling extra dependencies, especially since I'm working on 
Linaro toolchain integration lately. I'll give it some test when I have time 
and see if anything needs fixing...

-- 
Denys

