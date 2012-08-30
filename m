Return-Path: <tf+lists.yocto@r-finger.com>
Received: from r-finger.com (r-finger.com [178.79.160.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1ABE1E002AC
	for <meta-ti@yoctoproject.org>; Thu, 30 Aug 2012 12:54:37 -0700 (PDT)
Received: from [192.168.0.2] (host81-153-114-228.range81-153.btcentralplus.com
	[81.153.114.228]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 4B69C9ADE
	for <meta-ti@yoctoproject.org>; Thu, 30 Aug 2012 20:54:33 +0100 (BST)
Message-ID: <503FC4F8.9020509@r-finger.com>
Date: Thu, 30 Aug 2012 20:54:32 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <CALjj03Wphx5VuPkPxhYXsPJL9Pu-UsuFaCfxO17LVwTm-qO+mQ@mail.gmail.com>
	<20120830174807.GB26145@edge>
In-Reply-To: <20120830174807.GB26145@edge>
Subject: Re: Building a core-image-base
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
X-List-Received-Date: Thu, 30 Aug 2012 19:54:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 30/08/12 18:48, Denys Dmytriyenko wrote:
> On Tue, Aug 28, 2012 at 06:22:08PM -0400, Sebasti?n Bas Kana wrote:
>> I'm using Yocto/Poky and I'm trying to build an image for my Gumstix Overo.

Worth noting that meta-ti is not compatible with Yocto in numerous
subtle ways that you will have to work around; for example, in addition
to the things you noted, you might, want to add
'TOOLCHAIN_PATH="${STAGING_BINDIR_TOOLCHAIN}"' to your local.conf, or
some other suitable config location, as various meta-ti packages will
fail to compile without it.


> Not sure what was the problem with netbase, as it's quite self contained. Are 
> you sure you are using matching branches?

The problem is that meta-ti seems to be an endlessly moving target
tracking the master of oe core, while people using Yocto tend to use its
stable releases. meta-ti would really benefit from some formal release
process/schedule, but I guess as long as TI considers it to be a
community project only, this is unlikely to happen.


> Either way, you may be better off composing your own image recipe, if you 
> don't want to enable additional layers.

You don't have much of a choice here; you will need to pick some of
these packages from meta-openembedded into a layer of your own as for
now combining meta-openembedded with Yocto does not work; hopefully this
will be resolved at some point.

Tomas


