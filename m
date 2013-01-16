Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 59594E006C2
	for <meta-ti@yoctoproject.org>; Wed, 16 Jan 2013 06:55:19 -0800 (PST)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 15385F8124F; Wed, 16 Jan 2013 07:55:19 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 05F69F81244;
	Wed, 16 Jan 2013 07:55:18 -0700 (MST)
Message-ID: <50F6BF5E.3020705@mlbassoc.com>
Date: Wed, 16 Jan 2013 07:55:26 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1356784589-14296-1-git-send-email-gary@mlbassoc.com>
	<20130114233102.GB10163@denix.org>
In-Reply-To: <20130114233102.GB10163@denix.org>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] netbase: Fix file search path for 'interfaces'
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
X-List-Received-Date: Wed, 16 Jan 2013 14:55:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-01-14 16:31, Denys Dmytriyenko wrote:
> On Sat, Dec 29, 2012 at 05:36:29AM -0700, Gary Thomas wrote:
>> This .bbappend file is used to override the 'interfaces' file for
>> certain targets.  The current version is broken in that it does not
>> search the correct path(s).  This patch fixes that, as well as marking
>> the resulting package as target specific.
>
> Thanks. There was similar patch earlier, but w/o marking resulting package as
> machine specific. For that matter, shouldn't the main netbase recipe in
> oe-core do it instead? As it comes with bunch of qemu-arch-specific interfaces
> files anyway, and we just add one more for beagleboard...
>

Agreed.  When I get two minutes, I'll propose a new patch for meta-ti
for this as well as one for OE-core.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

