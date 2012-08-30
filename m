Return-Path: <tf+lists.yocto@r-finger.com>
Received: from r-finger.com (r-finger.com [178.79.160.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DD995E002AC
	for <meta-ti@yoctoproject.org>; Thu, 30 Aug 2012 13:56:26 -0700 (PDT)
Received: from [192.168.0.2] (host81-153-114-228.range81-153.btcentralplus.com
	[81.153.114.228]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id B4B399ADE
	for <meta-ti@yoctoproject.org>; Thu, 30 Aug 2012 21:56:25 +0100 (BST)
Message-ID: <503FD378.9020003@r-finger.com>
Date: Thu, 30 Aug 2012 21:56:24 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
CC: meta-ti@yoctoproject.org
References: <CALjj03Wphx5VuPkPxhYXsPJL9Pu-UsuFaCfxO17LVwTm-qO+mQ@mail.gmail.com>
	<20120830174807.GB26145@edge> <503FC4F8.9020509@r-finger.com>
	<20120830200833.GE26145@edge>
In-Reply-To: <20120830200833.GE26145@edge>
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
X-List-Received-Date: Thu, 30 Aug 2012 20:56:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 30/08/12 21:08, Denys Dmytriyenko wrote:
> For our TI SDK products and the new Arago "distribution", we are using said 
> "denzil" branch of meta-ti. 

Having a branch is great, but 'branch' and 'release' are very different
things; branch is a moving target, a release is a fixed point in time
that was tested and approved, and consequently one can have a reasonable
expectation (dare I say, a guarantee?), that it works. The current
denzil release is 7.0.1; there isn't a meta-ti commit that works with
this without jumping through hoops, is there? I think a BSP layer really
needs to have formal releases.

Tomas

