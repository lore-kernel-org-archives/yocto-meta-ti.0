Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 9FE21E006CB
	for <meta-ti@yoctoproject.org>; Fri, 25 Jan 2013 10:52:40 -0800 (PST)
Received: (qmail 7641 invoked by uid 1003); 25 Jan 2013 18:52:39 -0000
Received: from unknown (HELO ?192.168.1.107?)
	(philip@opensdr.com@96.240.188.95)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	25 Jan 2013 18:52:39 -0000
Message-ID: <5102D476.30204@balister.org>
Date: Fri, 25 Jan 2013 13:52:38 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: meta-ti mailing list <meta-ti@yoctoproject.org>
References: <alpine.DEB.2.02.1301240816240.7586@oneiric>
	<20130125172057.GD23977@denix.org>
	<1359135133.13917.15.camel@ted> <20130125173755.GD10087@edge>
In-Reply-To: <20130125173755.GD10087@edge>
X-Enigmail-Version: 1.5
Subject: Re: [PATCH] linux_3.1.bb: Remove bad line continuation.
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
X-List-Received-Date: Fri, 25 Jan 2013 18:52:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 01/25/2013 12:37 PM, Denys Dmytriyenko wrote:
> On Fri, Jan 25, 2013 at 05:32:13PM +0000, Richard Purdie wrote:
>> On Fri, 2013-01-25 at 12:20 -0500, Denys Dmytriyenko wrote:
>>> On Thu, Jan 24, 2013 at 08:16:38AM -0500, Robert P. J. Day wrote:
>>>>
>>>> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>>>>
>>>> ---
>>>>
>>>>   guessing just a copy and paste error, which currently generates:
>>>
>>> No, the recent change in bitbake to handle multiline comments slightly 
>>> different, i.e. stricter...
>>
>> Previously if you put something in place of that blank line uncommented,
>> bitbake might have ignored it under certain circumstances. This is
>> rather unexpected by users.
>>
>> We therefore made bitbake ask the users to say what they mean :)
>>
>> Its a bit of a short term pain but a win for usability after that.
> 
> Agree. Thanks.
> 


Think something like this in a bb file:

#FOO = "bar \
inherit something_important

Should the inherit be used or not? That is the question :)

This actually happened to "someone".

Philip

