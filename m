Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (hermes.mlbassoc.com [64.234.241.98])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EB59BE01408
	for <meta-ti@yoctoproject.org>; Fri, 25 May 2012 05:06:47 -0700 (PDT)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id A5B84F811DE; Fri, 25 May 2012 06:06:47 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 85E63F811DD;
	Fri, 25 May 2012 06:06:46 -0600 (MDT)
Message-ID: <4FBF75D6.9000300@mlbassoc.com>
Date: Fri, 25 May 2012 06:06:46 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <4FBBB531.8020401@communistcode.co.uk>
	<4FBBB786.8030501@mlbassoc.com>
	<4FBBB8E9.1040700@communistcode.co.uk>
	<20120522163158.GB15020@denix.org>
	<4FBCA367.701@communistcode.co.uk> <4FBCC147.90606@mlbassoc.com>
	<4FBCE8E4.6010208@communistcode.co.uk>
	<4FBE44EE.2070909@communistcode.co.uk>
	<4FBE4DE9.30501@mlbassoc.com> <1337928496.8248.173.camel@ted>
	<4FBF7014.8080609@mlbassoc.com> <4FBF70E8.5040802@r-finger.com>
In-Reply-To: <4FBF70E8.5040802@r-finger.com>
Subject: Re: Beaglebone + Poky
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
X-List-Received-Date: Fri, 25 May 2012 12:06:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-05-25 05:45, Tomas Frydrych wrote:
>
> Doesn't 'bitbake -g -u depexp' say what is pulling it in?

That's a new one for me :-)  It seems to show that the only thing that
depends on systemd (except for systemd related packages) is polkit.

Looking at the package-depends.dot file, I can see what does it:
   "polkit-dbg" -> "systemd"
Which is why this only happens when you add the dbg-pkgs feature.

> On 25/05/12 12:42, Gary Thomas wrote:
>> On 2012-05-25 00:48, Richard Purdie wrote:
>>> On Thu, 2012-05-24 at 09:04 -0600, Gary Thomas wrote:
>>>> I agree - there seem to be some recipes in meta-oe that don't play
>>>> nice with a non-systemd setup like Poky.
>>>>
>>>> Note: I was able to boot core-image-minimal built with meta-yocto +
>>>> meta-oe
>>>> in all configurations of EXTRA_IMAGE_FEATURES as long as 'dbg-pkgs' was
>>>> not specified.  As soon as I added that feature, it fails to come up
>>>> just
>>>> as you observed.  I'm not sure why (and I'm not too motivated to
>>>> research
>>>> more, I've already built this thing about 20 times in different ways...)
>>>
>>> That is a useful data point to have though, thanks for mentioning it on
>>> the list!
>>>
>>> I wonder if that somehow indirectly pulls in systemd itself?
>>
>> It does seem so.  I'm not sure what package caused it.  The attached
>> list of files (anything that mentions systemd) might give a clue.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

