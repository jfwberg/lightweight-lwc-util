public with sharing class LdtTesterLwcCtrl {

    @AuraEnabled
    public static utl.Ldt getTestTable(String recordId){
        try {
            
            // Create a lightning data table with matching columns for the output
            utl.Ldt ldt = new utl.Ldt()
                .setKeyField('Name')
                .setWrapTextMaxLines(5)
                .addColumn(
                    new utl.Ldt.Col(null, null)
                        .setInitialWidth(50)
                        .setType('userIcon')
                        .setTypeAttributes(
                            new utl.Ldt.TypeAttributes()
                                .setColor('userIconColor')
                        )
                )
                .addColumn(
                    new utl.Ldt.Col(null, null)
                        .setInitialWidth(50)
                        .setType('salesforceLogoIcon')
                        .setTypeAttributes(
                            new utl.Ldt.TypeAttributes()
                                .setColor('orgIconColor')
                        )
                )
                .addColumn(
                    new utl.Ldt.Col('Name', 'name')
                        .setType('text')
                        .setInitialWidth(150)
                )
                .addColumn(
                    new utl.Ldt.Col('Url', 'url')
                        .setType('url')
                        .setTypeAttributes(
                            new utl.Ldt.TypeAttributes()
                                .setLabel('Name')
                                .setTarget('_self')
                        )
                )
                .addColumn(
                    new utl.Ldt.Col('Email', 'email')
                        .setType('email')
                        .setInitialWidth(200)
                )
                .addColumn(
                    new utl.Ldt.Col('Checkbox', 'checkbox')
                        .setType('boolean')
                        .setInitialWidth(80)
                )
                .addColumn(
                    new utl.Ldt.Col('Text', 'text')
                        .setType('text')
                        .setInitialWidth(50)
                        .setWrapText(true)
                )
                .addColumn(
                    new utl.Ldt.Col('Actions', null)
                        .setType('action')
                        .setTypeAttributes(
                            new utl.Ldt.TypeAttributes()
                                .setMenuAlignment('auto')
                                .addRowAction(new utl.Ldt.RowAction('SSO Login',            'sso_login',            'utility:key'))
                                .addRowAction(new utl.Ldt.RowAction('Set Password',         'set_password',         'utility:password'))
                                .addRowAction(new utl.Ldt.RowAction('Set Color',            'set_color',            'utility:color_swatch'))
                        )
                        .setInitialWidth(80)
                )
            ;

            // Create the data table
            ldt.setData(new List<Map<String,Object>>{
                new Map<String,Object>{
                    'name'          => 'Henk de Vies',
                    'url'           => 'https://example.com',
                    'email'         => 'henkdevries@example.com',
                    'text'          => 'The quick brown fox jumps over the lazy dog',
                    'checkbox'      =>  true,
                    'userIconColor' => '#548712',
                    'orgIconColor'  => '#128754'
                }
            });

            // Return the data table
            return ldt;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}