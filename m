Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 474D6E00293
	for <meta-ti@yoctoproject.org>; Fri,  5 Oct 2012 14:57:17 -0700 (PDT)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 7AF98F8125D; Fri,  5 Oct 2012 15:57:12 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 7CB3DF81222;
	Fri,  5 Oct 2012 15:57:07 -0600 (MDT)
Message-ID: <506F57C5.7000400@mlbassoc.com>
Date: Fri, 05 Oct 2012 15:57:25 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120912 Thunderbird/15.0.1
MIME-Version: 1.0
To: "Cooper Jr., Franklin" <fcooper@ti.com>
References: <1349465081-10787-1-git-send-email-fcooper@ti.com>
	<506F2E82.8060906@mlbassoc.com>,
	<CA+2YH7ucY8NoMMc28fxsVav2cCg=n_6mYvama9Ox4t0ZowVizA@mail.gmail.com>
	<6CF2DE49-0D65-4216-B374-805CE3754A17@ti.com>
In-Reply-To: <6CF2DE49-0D65-4216-B374-805CE3754A17@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] wl12xx-firmware: Port wl12xx-firmware recipe
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
X-List-Received-Date: Fri, 05 Oct 2012 21:57:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-10-05 13:20, Cooper Jr., Franklin wrote:
> The custom git tree is wl12xx only not all the different components that linux-firmware provides. My understanding is that the team that works on wl12xx should be pushing it back to linux-firmware. But like I said this will contain the latest changes.

I still don't think it should be separate.  If the upstream (TI) stuff
isn't being properly tracked (there should be an effort to make this so),
just add a .bbappend that fixes things.  I use these packages and I don't
want to have to track the "flavour of the week" to keep current.

>
> On Oct 5, 2012, at 2:09 PM, "Enrico" <ebutera@users.berlios.de> wrote:
>
>> On Fri, Oct 5, 2012 at 9:01 PM, Gary Thomas <gary@mlbassoc.com> wrote:
>>> On 2012-10-05 13:24, Franklin S. Cooper Jr wrote:
>>>>
>>>> * Port wl12xx-firmware recipe from arago. This recipe was originally
>>>>    named linux-firmware in arago.
>>>> * Wl12xx-firmware provides the firmware files for use with the TI
>>>>    Wi-Fi + Bluetooth module.
>>>>
>>>> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>>>
>>>
>>> Why not just keep the main linux-firmware recipe up to date instead of
>>> duplicate
>>> functionality?
>>
>>
>> I made myself the same question at first, but the answer was there:
>>
>>
>>>> +# This recipe provides the latest firmware files for wl12xx.
>>>> +# Therefore, use the contents of this recipe instead of the contents
>>>> +# of linux-firmware-wl12xx.
>>
>>>> +SRC_URI = "git://github.com/TI-ECS/ti-utils.git;protocol=git"
>>
>>
>> Well one could ask why they are there and not in linux-firmware git
>> (not polemic, just curious).
>>
>> Enrico
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

