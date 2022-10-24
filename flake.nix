{
  outputs = { self, ... }: {
    templates = {
      python-venv = {
        path = ./python-venv;
        description = "A Python development environment using venv";
      };
      python = {
        path = ./python;
        description = "A simple Python development environment";
      };
    };

    defaultTemplate = self.templates.python;
  };
}
