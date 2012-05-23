Return-Path: <ml@communistcode.co.uk>
Received: from tinyArch.localdomain (unknown [78.110.170.148])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 01E11E013D1
	for <meta-ti@yoctoproject.org>; Wed, 23 May 2012 06:40:07 -0700 (PDT)
Received: from [192.168.0.18] (unknown [195.171.99.130])
	by tinyArch.localdomain (Postfix) with ESMTPSA id 05DEC43EC6
	for <meta-ti@yoctoproject.org>; Wed, 23 May 2012 14:22:33 +0100 (BST)
Message-ID: <4FBCE8E4.6010208@communistcode.co.uk>
Date: Wed, 23 May 2012 14:40:52 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <4FBBB531.8020401@communistcode.co.uk>
	<4FBBB786.8030501@mlbassoc.com>
	<4FBBB8E9.1040700@communistcode.co.uk>
	<20120522163158.GB15020@denix.org>
	<4FBCA367.701@communistcode.co.uk> <4FBCC147.90606@mlbassoc.com>
In-Reply-To: <4FBCC147.90606@mlbassoc.com>
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
X-List-Received-Date: Wed, 23 May 2012 13:40:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 23/05/12 11:51, Gary Thomas wrote:
> On 2012-05-23 02:44, Jack Mitchell wrote:
>> On 22/05/12 17:31, Denys Dmytriyenko wrote:
>>> On Tue, May 22, 2012 at 05:03:53PM +0100, Jack Mitchell wrote:
>>>> On 22/05/12 16:57, Gary Thomas wrote:
>>>>> On 2012-05-22 09:48, Jack Mitchell wrote:
>>>>>> Hi,
>>>>>>
>>>>>> I am currently trying to boot my beagleboard with a mix of
>>>>>> Poky/Meta-ti/meta-oe, I can build the image without error
>>>>>> however when I start booting the board the kernel gets to
>>>>>> 'freeing init memory' and seems to hang, although the beaglebone
>>>>>> light is still flashing and it will still accept keystrokes.
>>>>>> Could anyone shed any light on the situation?
>>>>>>
>>>>>> I am on the denzil branch for all three repositories.
>>>>>>
>>>>>> I have tried with USB only and USB + AC Adapter.
>>>>> What image did you use?
>>>> core-image-minimal - it does have a few extra programs added via
>>>> IMAGE_INSTALL but they are userspace only so shouldn't be affecting
>>>> the boot.
>>> Couple suggestions:
>>>
>>> 1. What's your init system? Since you have meta-oe mixed with poky, 
>>> check if
>>> there are any problems with sysvinit or systemd, in case there is 
>>> some mix up
>>> or confusion between those two...
>>>
>>> 2. Check your /etc/inittab for the correct tty used for getty, but 
>>> it doesn't
>>> look like it reaches the prompt yet...
>>>
>>
>> I am using Poky defaults so I assume it will be sysvinit... however I 
>> did see systemd being built, what would be the outline procedure to 
>> check that mixing of systems isn't
>> occurring? None of my reciepes have systemd support, but I assume 
>> something being pulled in from meta-oe does...
>>
>> My getty is being pushed to ttyO0, is this correct for the beaglebone?
>
> Can you put your images somewhere where I can access them?  I can give
> you an FTP push site if that helps?  I'd like to run through your image
> here on my BeagleBone.
>
> BTW, the only way meta-oe could be causing problems would be if you are
> using some recipe from it.  If you build exactly 'core-image-minimal' 
> with
> no extra packages, does it work for you?
>

Hi Gary,

I just tried without my addional programs to build a core-image-minimal 
and it still halts on the same kernel message. Something that I forgot 
to mention the yesterday was that I have a very high debugging level 
set, here is my local conf line:

EXTRA_IMAGE_FEATURES = "debug-tweaks tools-debug tools-profile dbg-pkgs"

Which could cause other programs to be brought in?

Regards,
Jack.

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--


