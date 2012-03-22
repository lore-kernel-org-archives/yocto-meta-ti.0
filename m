Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 57B7AE0059A
	for <meta-ti@yoctoproject.org>; Wed, 21 Mar 2012 17:25:59 -0700 (PDT)
Received: (qmail 24158 invoked by uid 1003); 22 Mar 2012 00:25:58 -0000
Received: from unknown (HELO ?184.48.57.244?)
	(philip@opensdr.com@184.48.57.244)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	22 Mar 2012 00:25:58 -0000
Message-ID: <4F6A7191.5090009@balister.org>
Date: Wed, 21 Mar 2012 18:25:53 -0600
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <CALKp9+Z+pk6GZR2UPwToxCLGsKw0FO-Jj4nOnXEocSfFWwZBzg@mail.gmail.com>	<E4FB558B-EFEA-42DF-B108-2EBB6B9B405D@dominion.thruhere.net>	<86ehsln0t7.fsf@coulee.tdb.com>	<ECCB2891-32C1-451D-B469-7B0B632D8641@dominion.thruhere.net>
	<1332365246.9740.195.camel@ted>
In-Reply-To: <1332365246.9740.195.camel@ted>
X-Enigmail-Version: 1.1.2
Cc: Marco Monguzzi <marco.monguzzi@gmail.com>, meta-ti@yoctoproject.org
Subject: Re: question on meta-ti for yocto
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
X-List-Received-Date: Thu, 22 Mar 2012 00:25:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 03/21/2012 03:27 PM, Richard Purdie wrote:
> 
> The biggest confusion factor out there at the moment is meta-ti, not
> poky and I'd like to ask politely for people to get their act together.

Richard,

meta-ti is the focus of the confusion at the moment because it is trying
to support several different use cases.

The confusion about poky, yocto, oe is widespread. At an SDR related
conference earlier this month, I was asked by some of the grad student
types what all these words mean. And I gave about the same answer as
Koen, but worded a little more diplomatically,

Even people that should know better are making statements that add to
the confusion. I am 99% certain Saul used the phrase "Poky build system"
at the Yocto developer day. We laughed about it afterwards, but this
shows how deep the confusion is.

I know you are trying to help solve the confusion problem. But I feel
Koen should not take all the heat for expressing his frustration. We, as
in the Yocto Advisory Board should do a better job communicating how all
the pieces fit together,

Philip

