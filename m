Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 07A0CE0030F
	for <meta-ti@lists.yoctoproject.org>;
	Thu, 26 Jan 2012 12:35:25 -0800 (PST)
Received: (qmail 18100 invoked by uid 1003); 26 Jan 2012 20:35:24 -0000
Received: from unknown (HELO ?192.168.1.104?)
	(philip@opensdr.com@96.240.160.175)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	26 Jan 2012 20:35:24 -0000
Message-ID: <4F21B90B.9020103@balister.org>
Date: Thu, 26 Jan 2012 15:35:23 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <1327599532-31609-1-git-send-email-koen@dominion.thruhere.net>	<CA+M6bXmFYnz62unD5Mq5-3cbTmk4rpuySETP7Kd134F_k+qXvw@mail.gmail.com>
	<F17AE0E2-A005-4000-A122-3C7BA4393875@dominion.thruhere.net>
In-Reply-To: <F17AE0E2-A005-4000-A122-3C7BA4393875@dominion.thruhere.net>
X-Enigmail-Version: 1.1.2
Cc: Ben Hilburn <ben@ettus.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [PATCH] linux-ti33x-psp 3.1: add dto patch to fix	problems with various sd cards
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
X-List-Received-Date: Thu, 26 Jan 2012 20:35:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 01/26/2012 01:12 PM, Koen Kooi wrote:
> 
> Op 26 jan. 2012, om 19:01 heeft Tom Rini het volgende geschreven:
> 
>> On Thu, Jan 26, 2012 at 10:38 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>>
>> I know the patch isn't yours but should we perhaps go in and make the
>> patch more obvious?  The function we're patching does a lot of
>> guesswork to find 'dto' and then we just say 'use the max'.  Why not
>> also go rip out that logic?
> 
> I was having the same conversation with Philip Balister on IRC just now :) It seems that this patch is being used by various TI customers to magically fix things so we do need to come up with a proper solution.

Basically, we are pissed of with really annoying SD card failures. (This
is an understatement, the problem cost me a lot of sleep at ELCE)

Unless someone has a better solution, we should rip out the hairy
calculation and set dto to 14 al the time and send the patch upstream.
Does anyone see any reason not to do this?

Philip

