Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (hermes.mlbassoc.com [64.234.241.98])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EE3C3E01217
	for <meta-ti@yoctoproject.org>; Tue, 20 Dec 2011 04:50:28 -0800 (PST)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 5ABDAF81292; Tue, 20 Dec 2011 05:50:27 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id E1459F81265;
	Tue, 20 Dec 2011 05:50:18 -0700 (MST)
Message-ID: <4EF0848A.4090906@mlbassoc.com>
Date: Tue, 20 Dec 2011 05:50:18 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <201112201115.39033.schnitzeltony@gmx.de>
	<FEF0BC67-DB90-448F-B36A-F847037D4CBE@dominion.thruhere.net>
	<201112201155.39426.schnitzeltony@gmx.de>
	<D926CBED-9400-4BD4-918D-D6A62C687658@dominion.thruhere.net>
In-Reply-To: <D926CBED-9400-4BD4-918D-D6A62C687658@dominion.thruhere.net>
Cc: meta-ti@yoctoproject.org
Subject: Re: commit b72cb13fcf83b9d342808ea30379bfb6a1321b54 breaks parse
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
X-List-Received-Date: Tue, 20 Dec 2011 12:50:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 2011-12-20 04:06, Koen Kooi wrote:
>
> Op 20 dec. 2011, om 11:55 heeft Andreas Müller het volgende geschreven:
>
>> On Tuesday, December 20, 2011 11:31:47 AM Koen Kooi wrote:
>>> Op 20 dec. 2011, om 11:15 heeft Andreas Müller het volgende geschreven:
>>>> On all my build machines  I get
>>>>
>>>> Loading cache: 100% |
>>>> #########################################################################
>>>> #####################################################################|
>>>> ETA:  00:00:00
>>>> Loaded 1880 entries from dependency cache.
>>>> ERROR: Unable to parse
>>>> /home/andreas/data/oe-core/sources/meta-ti/recipes-
>>>> kernel/linux/linux_3.1.bb
>>>> ...
>>>> IOError: [Errno 2] No such file or directory:
>>>> '/home/andreas/data/Downloads/packets/dl/defconfig'
>>>
>>> I'm not seeing any of that, but I'm keeping an eye on it.
>> Hm.. can you try to set DL_DIR outside of OE_BASE?
>
> My setup is:
>
> /OE/tentacle/oebb.sh ->  DL_DIR /OE/downloads (debian)
> ~/Angstrom/oebb.sh ->  DL_DIR ~/Angstrom/sources/downloads (fedora)
>
> Both don't seem to suffer from the defconfig problem yet.
>
> regards,
>
> Koen

What version of bitbake & python are each of you running?  Since the
error is happening during the parsing of new python code, this might
be significant.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

