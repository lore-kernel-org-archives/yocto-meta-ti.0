Return-Path: <gary@mlbassoc.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 875DBE008EC; Thu,  9 Apr 2015 15:24:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 733F6E0049A
	for <meta-ti@yoctoproject.org>; Thu,  9 Apr 2015 15:23:57 -0700 (PDT)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id CAAD4F811DD; Thu,  9 Apr 2015 16:23:56 -0600 (MDT)
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 81B7FF811D7;
	Thu,  9 Apr 2015 16:23:55 -0600 (MDT)
Message-ID: <5526FC0D.8030406@mlbassoc.com>
Date: Thu, 09 Apr 2015 16:24:13 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <55254865.1010209@mlbassoc.com> <20150408153348.GA4753@edge>
	<55254F2E.4040308@mlbassoc.com> <20150409214018.GD6414@edge>
In-Reply-To: <20150409214018.GD6414@edge>
Cc: meta-ti@yoctoproject.org
Subject: Re: No USB on BeagleBone White
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
X-List-Received-Date: Thu, 09 Apr 2015 22:24:07 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-04-09 15:40, Denys Dmytriyenko wrote:
> On Wed, Apr 08, 2015 at 09:54:22AM -0600, Gary Thomas wrote:
>> On 2015-04-08 09:33, Denys Dmytriyenko wrote:
>>> On Wed, Apr 08, 2015 at 09:25:25AM -0600, Gary Thomas wrote:
>>>> I need to resurrect my old BeagleBone White and I'm trying to
>>>> do it using Poky/Yocto + meta-ti.  I've managed to build and
>>>> boot my board, but it detects nothing when something is plugged
>>>> into the USB [not OTG/serial-port] port.
>>>>
>>>> Any ideas what I need to do to get this going?  The board is
>>>> pretty useless to me without the extra USB.
>>>
>>> Which kernel recipe do you use?
>>>
>>
>> I used the default from meta-ti/master
>>    linux-ti-staging/3.14.35-r22e+gitrAUTOINC+b60f54ead7
>>
>> I also had an old image left around from last June which was a 3.12.20
>> kernel which has the same behaviour.
>>
>> I've tried this on both a BeagleBone Black and White (I have
>> one of each side-by-side on my desk) and USB does not work
>> on either.
>>
>> Is there some configuration I'm missing or something?
>
> Can you check that you have these 2 commits in your OE-Core layer:
>
> http://cgit.openembedded.org/openembedded-core/commit/?id=70a695735e0a7d14448f2f5a9986bfe105210a91
> http://cgit.openembedded.org/openembedded-core/commit/?id=6aae37c66fb6e7153b829ad860b7e7f94e804bd4
>

Yes, I'm using the latest master.

This question did lead me to the answer: my image had no kernel
modules, hence there was no USB support!  I added in the correct
modules and now I have USB.

Thanks

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

