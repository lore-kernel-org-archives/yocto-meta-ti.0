Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 60EE8E0027F
	for <meta-ti@yoctoproject.org>; Mon, 17 Sep 2012 13:54:22 -0700 (PDT)
Received: (qmail 24124 invoked by uid 1003); 17 Sep 2012 20:54:19 -0000
Received: from unknown (HELO ?10.16.24.82?) (philip@opensdr.com@157.22.28.10)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	17 Sep 2012 20:54:19 -0000
Message-ID: <50578DF9.1030904@balister.org>
Date: Mon, 17 Sep 2012 13:54:17 -0700
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120828 Thunderbird/15.0
MIME-Version: 1.0
To: Enrico <ebutera@users.berlios.de>
References: <20120914064306.GC26968@edge>
	<7D46E86EC0A8354091174257B2FED101591F5F33@DLEE12.ent.ti.com>
	<CA+2YH7vzOwfqcfhM1xu8W=LmD-UV58zLQ6=XvokrCTh1AUvMnA@mail.gmail.com>
In-Reply-To: <CA+2YH7vzOwfqcfhM1xu8W=LmD-UV58zLQ6=XvokrCTh1AUvMnA@mail.gmail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: RFC: 2 possible workarounds for recipes-misc dependency on Angstrom
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
X-List-Received-Date: Mon, 17 Sep 2012 20:54:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/17/2012 01:36 PM, Enrico wrote:
> On Fri, Sep 14, 2012 at 10:06 PM, Maupin, Chase <chase.maupin@ti.com> wrote:
>> So really I think the question is do we have an agreement on "meta-beagle" or whatever it should be called, a timeline for it to be created and the recipes moved?  Let's make meta-ti be the foundation BSP that we can all build on top of and nothing more or less.
>
> Sorry to jump into the discussion but...am i the only one that thinks
> that having meta-beagle, meta-panda, meta-whateverTIboard is crazy?

Whether or not Beagle is a TI board ....

It seems like the broader issue (and one I am falling over at the 
moment) is that we want some image recipes in BSP's. The images have 
different layer dependencies.

So we have a set of small images (such as board bring up and test 
images) that depend only on oe-core, and more complex images that depend 
on other layers. We can always mask the more complex images for the case 
where we want to only build against oe-core, but this is not the most 
convenient from a user point of view.

It seems like we need a way for an image to specify the layers it 
requires and if those layers are not present, the recipe will not build, 
but will not break parsing either.

Philip

>
> Enrico
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>
>

