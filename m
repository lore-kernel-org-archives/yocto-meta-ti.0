Return-Path: <tf+lists.yocto@r-finger.com>
Received: from r-finger.com (r-finger.com [178.79.160.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 35E70E01402
	for <meta-ti@yoctoproject.org>; Fri, 25 May 2012 04:45:46 -0700 (PDT)
Received: from [192.168.0.2] (host86-170-72-228.range86-170.btcentralplus.com
	[86.170.72.228]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 78E9460E52
	for <meta-ti@yoctoproject.org>; Fri, 25 May 2012 12:45:45 +0100 (BST)
Message-ID: <4FBF70E8.5040802@r-finger.com>
Date: Fri, 25 May 2012 12:45:44 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.3) Gecko/20120329 Icedove/10.0.3
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
	<4FBF7014.8080609@mlbassoc.com>
In-Reply-To: <4FBF7014.8080609@mlbassoc.com>
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
X-List-Received-Date: Fri, 25 May 2012 11:45:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Doesn't 'bitbake -g -u depexp' say what is pulling it in?

Tomas

On 25/05/12 12:42, Gary Thomas wrote:
> On 2012-05-25 00:48, Richard Purdie wrote:
>> On Thu, 2012-05-24 at 09:04 -0600, Gary Thomas wrote:
>>> I agree - there seem to be some recipes in meta-oe that don't play
>>> nice with a non-systemd setup like Poky.
>>>
>>> Note: I was able to boot core-image-minimal built with meta-yocto +
>>> meta-oe
>>> in all configurations of EXTRA_IMAGE_FEATURES as long as 'dbg-pkgs' was
>>> not specified.  As soon as I added that feature, it fails to come up
>>> just
>>> as you observed.  I'm not sure why (and I'm not too motivated to
>>> research
>>> more, I've already built this thing about 20 times in different ways...)
>>
>> That is a useful data point to have though, thanks for mentioning it on
>> the list!
>>
>> I wonder if that somehow indirectly pulls in systemd itself?
> 
> It does seem so.  I'm not sure what package caused it.  The attached
> list of files (anything that mentions systemd) might give a clue.
> 
> 
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


